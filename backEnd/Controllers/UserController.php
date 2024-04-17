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
            'Tier'  => $_POST['Tier'],
            'Role'  => $_POST['Role'] == "Admin" ? 1 : 0
        ];
        if ($this->model->checkuser_name($data['UserName'])) {
            $this->model->mInsert($data);
            exit("true");
        } else {
            exit("false");
        }
    }

    public function update()
    {
        $data = [
            'Name'        => $_POST['Name'],
            'UserName'        => $_POST['UserName'],
            'currentpass' => $_POST['currentpass'],
            'newpass'     => $_POST['newpass']
        ];

        if ($this->model->mUpdate($data)) header("Location: ../frontend/client.html?update=true");
        else header("Location: ../frontend/client.html?update=false");
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
            header("Location: ../frontend/client/?loginFailed=" . $data['UserName']);
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
