<div class="container">
    <div class="row">

<div class="container my-4 p-5 bg-hero rounded">
    <div class="py-5 text-white">
        <p class="display-5 fw-bold">Galeri Foto</p>
        <p class="fs-4 col-md-8"> Ekspresikan karya mu disini! </p>
    </div>
</div>

<div class="container">
    <body class="bg-light">
    <div class="row">
        <?php 
        $tampil=mysqli_query($conn, "SELECT * FROM foto INNER JOIN user ON foto.UserID=user.UserID");
        foreach($tampil as $tampils):
        ?>
        <div class="col-6 col-md-4 col-lg-3 mb-4">
            <div class="card">
                <img src="uploads/<?= $tampils['NamaFile'] ?>" class="object-fit-cover" style="aspect-ratio: 16/9;">
                <div class="card-body">
                    <h5 class="card-title"><?= $tampils['JudulFoto'] ?></h5>
                    <p class="card-text text-muted"> Dari : <?= $tampils['Username'] ?></p>
                    <a href="?url=detail&&id=<?= $tampils['FotoID'] ?>" class="btn btn-danger">Detail</a>
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>