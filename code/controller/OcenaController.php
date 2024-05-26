<?php

require_once("model/OcenaDB.php");
require_once("ViewHelper.php");

class OcenaController{
    public static function showAddOcena(){
        ViewHelper::render("view/add-ocena.php", []);
    }

    public static function add(){
        session_start();
        $userID = UserDB::getId($_SESSION["username"]);
        $filmID = $_POST["idFilma"];
        $options = array(
            'options' => array(
                'min_range' => 1,
                'max_range' => 5
            )
        );
        $stOcena = filter_input(INPUT_POST, "stOcena", FILTER_SANITIZE_NUMBER_INT, $options);
        $opisOcena = filter_input(INPUT_POST, "opisOcena", FILTER_SANITIZE_SPECIAL_CHARS) ? filter_input(INPUT_POST, "opisOcena", FILTER_SANITIZE_SPECIAL_CHARS) : null;
        if($userID && $filmID && $stOcena){
            OcenaDB::insert($stOcena, $opisOcena, $userID, $filmID);
            ViewHelper::redirect(BASE_URL . "index");
        } else {
            ViewHelper::render("view/add-ocena.php", ["napaka" => "Napaka pri vnosu ocene."]);
        }
    }
}