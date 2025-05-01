<?= $this->extend('layout/template'); ?>
<?= $this->section('content'); ?>

<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="pesan" data-pesan="<?= session('pesan') ?>"></div>
            <style>
                .justify-content-between {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                #date-pick {
                    padding: 5px;
                    border: 1px solid #ccc;
                    border-radius: 5px;
                    font-size: 16px;
                    background-color: #f9f9f9;
                    margin-bottom: 15px;
                }

                #cari_data {
                    padding: 5px 20px;
                    border: none;
                    border-radius: 5px;
                    background-color: #28a745;
                    color: white;
                    font-size: 16px;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                    margin-right: 1000px;
                    margin-bottom: 15px;
                }

                #cari_data:hover {
                    background-color: #218838;
                }
            </style>

            <div class="justify-content-between">
                <input type="date" id="date-pick"/>
                <button id="cari_data">Cari</button>
            </div>

            <div class="table-responsive">
                
                <table class="table table-bordered table-striped" id="tabel-invoice" width="100%">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Invoice</th>
                            <th>Tanggal</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection(); ?>

<?= $this->section('js'); ?>
<script>
    let table;
    $(document).ready(function() {
        let pesan = $(".pesan").data('pesan')
        if (pesan != '') {
            toastr.error(pesan)
        }
        table = $("#tabel-invoice").DataTable({
            proseccing: true,
            serverSide: true,
            order: [
                [1, "desc"]
            ],
            ajax: {
                url: `${BASE_URL}/penjualan/invoice`,
                data: function(d) {
                    d.tanggal = $('#date-pick').val(); // ini mengirim input tanggal ke server
                }
            },
            //optional
            "lengthMenu": [
                [5, 10],
                [5, 10]
            ],
            "columns": [{
                    render: function(data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }
                },
                {
                    data: 'invoice'
                },
                {
                    data: 'tanggal'
                },
                {
                    render: function(data, type, row) {
                        let html = `<button class="btn btn-success btn-sm print" data-id='${row.id}'><i class="fas fa-print"></i></button>`;
                        return html;
                    }
                }
            ],
            columnDefs: [{
                    targets: 0,
                    width: "5%"
                },
                {
                    targets: [0, 3],
                    className: "text-center"
                },
                {
                    targets: [0, 3],
                    orderable: false
                },
                {
                    targets: [0, 2, 3],
                    searchable: false
                }
            ]
        });
        $(document).on('click', '.print', function(e) {
            window.open(`${BASE_URL}/penjualan/cetak/` + $(this).data('id'))
        });
    });

    flatpickr("#date-pick", {
        mode: "range"
    });

    $('#cari_data').on('click', function(e){
        table.draw();
    })
</script>

<?php $this->endSection(); ?>