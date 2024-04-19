<?php

class UserController extends BaseController
{
    private $model;

    public function __construct()
    {
        $this->loadModel('UserModel');
        $this->model = new UserModel;
    }

    public function index()
    {
        $data = $this->model->mAlls();

        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public function find()
    {
        $id = $_GET['id'];
        $user = $this->model->mFind($id);

        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($user);
    }

    public function insert()
    {
        $data = [
            'Name'  => $_POST['Name'],
            'UserName'  => $_POST['UserName'],
            'Password'  => $_POST['Password'],
        ];
        if (isset($_POST['Tier']) && isset($_POST['Role'])) {
            $data['Tier'] = $_POST['Tier'];
            $data['Role'] = $_POST['Role'] == "Admin" ? 1 : 0;
        }
        if (isset($_POST['Email']) && isset($_POST['Address']) && isset($_POST['Phone'])) {
            $data['Email'] = $_POST['Email'];
            $data['Address'] = $_POST['Address'];
            $data['Phone'] = $_POST['Phone'];
        }
        if ($this->model->checkuser_name($data['UserName'])) {
            $this->model->mInsert($data);
            echo "true";
            header("Location: ../frontend/client/?signupSuccfully=true");
        } else {
            echo "false";
            header("Location: ../frontend/client/?signupFailed=true");
        }
    }

    public function update()
    {
        $userID = $_GET['userID'];
        $data = [
            'Name'         => $_POST['Name'],
            'Tier'         => $_POST['Tier'],
        ];
        if ($_POST['Password'] != "") $data['Password'] = $_POST['Password'];

        $this->model->mUpdate($userID, $data);
        header("Location: ../frontend/admin/?page=users");
    }

    public function delete()
    {
        $id = $_GET['id'];
        $this->model->mDelete($id);
        header("Location: ../frontend/admin/?page=users");
    }

    public function login()
    {
        $data = [
            'UserName'  => $_POST['UserName'],
            'Password'  => $_POST['Password']
        ];

        $check = $this->model->isValidUser($data);
        if ($check) {
            header("Location: ../frontend/client/?loginSuccfully=true");
        } else {
            header("Location: ../frontend/client/?loginFailed=true" . $data['UserName']);
        }
    }

    public function logout()
    {
        setcookie("user_id", "", time() - 3600, "/");
        header("Location: ../frontend/client/?logoutFailed=true");
    }

    public function check()
    {
        $role = $this->model->checkUserRole();
        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($role);
    }
}
