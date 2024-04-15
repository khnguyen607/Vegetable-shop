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

    public function findUser()
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

    public function addLibrarian()
    {
        $data = [
            'Name'  => $_POST['Name'],
            'UserName'  => $_POST['UserName'],
            'Password'  => $_POST['Password'],
            'Role'  => '1'
        ];

        if ($this->model->checkuser_name($data['UserName'])) {
            $this->model->bmInsert($data);
            header("Location: ../frontend/dashboard.html?tab=mgr__user");
        } else {
            header("Location: ../frontend/dashboard.html?tab=mgr__user&sign_up=false");
        }
    }

    public function editUser()
    {
        $id = $_GET['id'];
        $data = [
            'Name'  => $_POST['Name']
        ];

        $this->model->mUpdate($id, $data);
        header("Location: ../frontend/dashboard.html?tab=mgr__user");
    }

    public function updateUser()
    {
        $data = [
            'Name'        => $_POST['Name'],
            'UserName'        => $_POST['UserName'],
            'currentpass' => $_POST['currentpass'],
            'newpass'     => $_POST['newpass']
        ];

        if ($this->model->updateU($data)) header("Location: ../frontend/client.html?update=true");
        else header("Location: ../frontend/client.html?update=false");
    }

    public function delUser()
    {
        $id = $_GET['id'];
        $data = [
            'status' => '0'
        ];
        $this->model->mUpdate($id, $data);
        header("Location: ../frontend/dashboard.html?tab=mgr__user");
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
