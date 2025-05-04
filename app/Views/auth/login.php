<?= $this->extend('auth/auth_template'); ?>
<?= $this->section('auth'); ?>

<style>
    /* Add background image to the login page */
    body {
        background-image: url('<?= base_url('uploads/permainan.png'); ?>');
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
        height: 100vh; /* Full viewport height */
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    .login-logo a {
        color: #fff; /* Adjust the logo text color if necessary */
        font-size: 26px; /* Make the logo text bigger */
        font-weight: bold; /* Bold the text */
        background: linear-gradient(45deg, #ff8c00, #ff0080); /* Gradiant effect */
        -webkit-background-clip: text;
        background-clip: text;
        animation: glow 1.5s infinite alternate; /* Glow animation */
        text-align: center; /* Center the logo text */
    }

    /* Glow animation for text */
    @keyframes glow {
        0% {
            text-shadow: 0 0 10px #ff8c00, 0 0 20px #ff8c00, 0 0 30px #ff0080, 0 0 40px #ff0080;
        }
        100% {
            text-shadow: 0 0 20px #ff8c00, 0 0 30px #ff0080, 0 0 40px #ff0080, 0 0 50px #ff0080;
        }
    }

    .card {
        background-color: rgba(255, 255, 255, 0.8); /* Add a semi-transparent background to the login card */
        border-radius: 40px;
        width: 500px; /* Perbesar lebar form */
        padding: 25px;
        transition: all 0.3s ease;
    }

    /* Perbesar input dan tombol */
    .form-control {
        font-size: 18px;
        padding: 15px;
        border-radius: 10px;
    }

    .btn-primary {
        font-size: 18px;
        padding: 10px;
        border-radius: 10px;
    }

    /* Tambahkan efek bayangan hijau saat kursor dekat */
    .card:hover {
        box-shadow: 0 4px 15px rgba(0, 255, 0, 0.6); /* Efek bayangan hijau */
        transform: translateY(-5px); /* Efek sedikit mengangkat card */
    }

    .card-body {
        padding: 20px;
    }

    @media (max-width: 768px) {
        .card {
            width: 90%; /* Agar form lebih responsif di layar kecil */
        }
    }
</style>

<!-- /.login-logo -->
<div class="card">
    <div class="card-body login-card-body">
        <h2 class="login-box-msg">LOGIN</h2>
        <?= form_open(base_url('auth/login')); ?>
        <div class="input-group mb-3">
            <input type="text" class="form-control" id="username" name="username" placeholder="Username" autofocus>
            <div class="input-group-append">
                <div class="input-group-text">
                    <span class="fas fa-user"></span>
                </div>
            </div>
            <small class="invalid-feedback"></small>
        </div>
        <div class="input-group mb-3">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" autocomplete="off">
            <div class="input-group-append show-password">
                <div class="input-group-text">
                    <span class="fas fa-eye-slash"></span>
                </div>
            </div>
            <small class="invalid-feedback"></small>
        </div>
        <div class="row">
            <div class="col-8">
                <div class="icheck-primary">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember Me</label>
                </div>
            </div>
            <!-- /.col -->
            <div class="col-4">
                <button type="submit" class="btn btn-primary btn-block" id="login">Login</i></button>
            </div>
            <!-- /.col -->
        </div>
        <?= form_close(); ?>
    </div>
    <!-- /.login-card-body -->
</div>

<?= $this->endSection(); ?>
