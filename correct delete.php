<?php 

include'config.php';
        

    class SelectUserData{
                private $conn;
                public function __construct($conn){
                    $this->conn=$conn;

                    if($this->conn->connect_error){
                        die("Connection failed:" .$this->conn->connect_error);
                    }
                }
                Public function getUser(){
                    $id = $_GET['id'];
        
    $sql = "DELETE FROM dacoljc1 WHERE userid=$id";
    $result = $this->conn->query($sql);

    header('location:selectUser.php');

            }}

            $userData=new SelectUserData($conn);
            $users=$userData->getUser();

?>
