<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>FilmBuzz: <?=$film[0]["naslov"]?></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .divMnenje {
            border-top: 1px solid black;
            border-bottom: 1px solid black;
            margin: 15px 0px;
            width: 100%;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="jumbotron text-center" style="margin-bottom:0">
        <h1><?=$film[0]["naslov"]?></h1>
    </div>
    <?php include("navbar.php"); ?>  

    <div class="container">
        <div class="row" style="margin-top: 30px; margin-bottom: 30px;">
            <div class="col-4 d-flex justify-content-center align-items-center">
                <img style="width: 200px;" class="img-fluid" src="<?="../.".$film[0]["slika"]?>" alt="Slika">
            </div>
            <div class="col-sm d-flex flex-column justify-content-center">
                <h4>Režiser: <?=$film[0]["ime"] . " " . $film[0]["priimek"]?></h4>
                <h4>Leto: <?=$film[0]["leto"]?></h4>
                <h4>Povprečna ocena: <?=FilmiDB::getAvgOcena($_GET["id"]) ? FilmiDB::getAvgOcena($_GET["id"]) : "Za ta film še ni ocen."?></h4>
            </div>
        </div>
        <h2>Mnenja uporabnikov:</h2>
        <?php foreach ($ocene as $ocena): ?>
            <div class="row">
                <div class="divMnenje">
                    <p>Avtor Mnenja: <b><?=$ocena["username"]?></b></p>
                    <p>Ocena: <b><?=$ocena["ocena"]?></b></p>
                    <p>Opis: <b><?=$ocena["opis"]?></b></p>
                    <?php if (isset($_SESSION["username"]) && $_SESSION["username"] == "admin"): ?>
                        <br><a style="margin-top: 5px;" href="<?=BASE_URL . "ocena/remove?id=" . $ocena["id"]?>" class="btn btn-danger" onclick="return confirmDelete('<?=$ocena["naslov"]?>')">Odstrani oceno</a>
                    <?php endif; ?>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
    
    <?php include("footer.php")?>
</body>
</html>
