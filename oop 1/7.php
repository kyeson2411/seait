<table class="table">
    <thead>
        <tr>
            <th>No</th>
            <th>Username</th>
            <th>Password</th>
            <th>User type</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
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
            $sql = "INSERT INTO userates(username, userpass, usertype) VALUES ('$this->username', '$this->userpass', '$this->usertype')";
            $con = $this->conn;
            echo "<script>window.alert('User Data Has Been Saved');</script>";
            $result = $con->query($sql);
        }
    }

    $InsertData1 = new InsertData($uname, $upass, $utype, $conn);
    $InsertData1->getData();
}
        include('3.php');
        

        $id = $_GET['id'] ?? null;
        if($id !== null) {
            $sql = "DELETE FROM userates WHERE userid=$id";
            $result = $conn->query($sql);
            header('location: 4.php');
            exit;
        }
        

        $sql = "SELECT * FROM userates";
        $result = $conn->query($sql);
        $x = 0;
        while($row = $result->fetch_assoc()) {
            $x++;
        ?>
            <tr>
                <td><?php echo $x; ?></td>
                <td><?php echo $row['username']; ?></td>
                <td><?php echo $row['userpass']; ?></td>
                <td><?php echo $row['usertype']; ?></td>
                <td><a href="6.php?id=<?php echo $row['userid']; ?>" class="btn btn-warning">Delete</a></td>
            </tr>
        <?php
        }
        ?>
    </tbody>
</table>