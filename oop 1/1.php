<!DOCTYPE html>
<html>
<head>
    <title>ADD USER FORM</title>
    <?php include('5.php'); ?>
</head>
<body>
        <div class="row">
            <div class="col-6"> 

                <br><br><br><br>
                <h3 class="text-center">USER REGISTRATION FORM</h3>
                <center>           <img src="z.gif" width="250" height="250">
  </center>
     </div>
           <div class="col-4">
            <br><br>
            <div class="card">
                <div class="card-body">
                     <?php include('2.php'); ?>

                </div>
            </div>

           
</div>
            <div class="col-2"></div>
        </div>
        </body>
</html>

<?php
if (isset($_POST['submit'])) {
    $uname = $_POST['uname'];
    $upass = $_POST['upass'];
    $utype = $_POST['utype'];

    include('3.php');

    class InsertData{
        private $username;
        private $userpass;
        private $usertype;
        private $conn;

        public function __construct($uname, $upass, $utype, $connection){
            $this->username = $uname;
            $this->password = $upass;
            $this->usertype = $utype;
            $this->conn = $connection;
        }
        public function getUname(){
            return $this-> username;
        }
        public function getUpass(){
            return $this-> userpass;
        }
        public function getUtype(){
            return $this-> usertype;
        }

        public function getData(){
            $sql = "INSERT INTO userates(username, userpass, usertype) VALUES ('$this->username', '$this->password', '$this->usertype')";
            $con = $this->conn;
            echo "<script>window.alert('User Data Has Been Saved');</script>";
            $result = $con->query($sql);
        }
    }

    $InsertData1 = new InsertData($uname, $upass, $utype, $conn);
    $InsertData1->getData();
}
?>