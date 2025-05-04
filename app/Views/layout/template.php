<?= $this->extend('layout/template'); ?>
<?= $this->section('content'); ?>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <!-- Profile Image -->
            <div class="card card-primary card-outline">
                <div class="card-body box-profile">
                    <div class="text-center">
                        <img class="img-fluid img-circle avatar" src="<?= base_url('uploads/profile/' . esc($user->avatar)) ?>" id="avatar-preview">
                    </div>
                    <h3 class="profile-username text-center"></h3>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="card card-primary card-outline">
                <div class="card-body">
                    <?= form_open_multipart(base_url('/user/ubah'), ['csrf_id' => 'token']); ?>
                    <!-- Other form fields... -->
                    <div class="form-group row">
                        <label for="avatar" class="col-sm-2 col-form-label">Photo Profile</label>
                        <div class="col-sm-2 d-none">
                            <img class="img-thumbnail" id="img-preview">
                        </div>
                        <div class="col-sm-4">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="avatar" name="avatar">
                                <label class="custom-file-label" for="avatar">Upload Photo</label>
                                <small class="invalid-feedback"></small>
                            </div>
                        </div>
                    </div>
                    <!-- More fields... -->
                    <div class="form-group row">
                        <input type="hidden" name="avatarLama" id="avatarLama" value="<?= esc($user->avatar); ?>">
                        <div class="offset-sm-2 col-sm-10">
                            <button type="submit" id="simpan" class="btn btn-success">Simpan</button>
                        </div>
                    </div>
                    <?= form_close(); ?>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal for Image Cropping -->
<div class="modal fade" id="modal-crop" tabindex="-1" role="dialog" aria-labelledby="modal-cropLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modal-cropLabel">Crop Image</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="img-container">
                    <img id="image" src="" alt="Picture">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="crop-image">Crop & Save</button>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection(); ?>

<?= $this->section('js'); ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.5.12/cropper.min.js"></script>
<script>
    let cropper;

    // Image Preview before upload
    $("#avatar").on("change", function(e) {
        let file = e.target.files[0];

        // Validate file type (image) and size (max 5MB)
        if (file && file.type.startsWith("image/") && file.size <= 5242880) {
            let src = URL.createObjectURL(file);
            $("#img-preview").prop("src", src).parent().removeClass("d-none");

            // Open crop modal
            $('#modal-crop').modal('show');
            $('#image').prop('src', src);

            // Initialize cropper
            if (cropper) {
                cropper.destroy();
            }
            cropper = new Cropper(document.getElementById('image'), {
                aspectRatio: 1,
                viewMode: 2,
                preview: '.img-preview'
            });
        } else {
            alert("Please upload a valid image file (less than 5MB).");
        }
    });

    // Crop and save image
    $('#crop-image').on('click', function() {
        let canvas = cropper.getCroppedCanvas({
            width: 300, // Resize to desired size
            height: 300
        });

        canvas.toBlob(function(blob) {
            let formData = new FormData();
            formData.append('avatar', blob);
            formData.append('csrf_id', $('input[name="csrf_id"]').val()); // Add CSRF token

            $.ajax({
                url: $('form').attr('action'),
                method: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    if (response.sukses) {
                        $(".avatar").attr("src", response.avatar_url); // Update avatar preview
                        $('#modal-crop').modal('hide');
                    } else {
                        alert('Error uploading image!');
                    }
                }
            });
        });
    });
</script>
<?= $this->endSection(); ?>
