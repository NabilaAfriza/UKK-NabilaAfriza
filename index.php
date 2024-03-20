<?php 
include 'koneksi.php'; 
session_start();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website Galeri Foto | Nabila Afriza</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="icon" href="assets/img/gallery.png" type="image/x-icon">
    
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
    <div class="container">
        <a class="navbar-brand" href="?url=home"> Website Galeri Foto </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
            <a class="nav-link" href="?url=home">Home</a>
            <?php if(isset($_SESSION['user_id'])): ?>
            <a class="nav-link" href="?url=upload">Upload</a>
            <a class="nav-link" href="?url=album">Album</a>
            
            <div class="dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <?= ucwords($_SESSION['username']) ?>
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="?url=profile"><i class="fa-solid fa-fw fa-user"></i> Profile</a></li>
                <li><a class="dropdown-item" href="?url=logout"><i class="fa-solid fa-right-from-bracket fa-fw"></i> Logout</a></li>
            </ul>
            </div>
            
            <?php else: ?>
            <a class="nav-link" href="login.php">Login</a>
            <a class="nav-link" href="daftar.php">Daftar</a>
            <?php endif; ?>
        </div>
        </div>
    </div>
    </nav>
    
    <?php 
        $url=@$_GET["url"];
        if($url=='home'){
            include 'page/home.php';
        }elseif($url=='profile'){
            include 'page/profil.php';
        }else if($url=='upload'){
            include 'page/upload.php';
        }else if($url=='album'){
            include 'page/album.php';
        }else if($url=='like'){
            include 'page/like.php';
        }else if($url=='dislike'){
            include 'page/dislike.php';
        }else if($url=='komentar'){
            include 'page/komentar.php';
        }else if($url=='detail'){
            include 'page/detail.php';
        }else if($url=='kategori'){
            include 'page/kategori.php';
        }else if($url=='logout'){
            session_destroy();
            header("Location: ?url=home");
        }else{
            include 'page/home.php';
        }
    ?>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>