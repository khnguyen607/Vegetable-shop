<?php

class OrderController extends BaseController
{
    private $model;

    public function __construct()
    {
        $this->loadModel('OrderModel');
        $this->model = new OrderModel;
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
        $data = $this->model->mFind($id);
        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public function insert()
    {
        $data = [
            'Name'      => $_POST['Name']
        ];

        $this->model->mInsert($data);
        echo "true";
    }

    public function update()
    {
        $id = $_GET['id'];
        $data = [
            'Name'      => $_POST['Name']
        ];

        $this->model->mUpdate($id, $data);

        echo "true";
    }

    public function delete()
    {
        $id = $_GET['id'];
        $this->model->mDelete($id);
        header("Location: ../frontend/admin/?page=nutritionists");
    }

    public function getAllsFK()
    {
        $data = $this->model->mGetAllsFK();

        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public function changeStatus()
    {
        $id = $_GET['id'];
        $currentStatus = $_GET['currentStatus'];
        $newStaus = null;
        switch ($currentStatus) {
            case 'Chờ duyệt':
                $newStaus = "Đã duyệt";
                break;
            case 'Đã duyệt':
                $newStaus = "Đang giao hàng";
                break;
            case 'Đang giao hàng':
                $newStaus = "Đã giao hàng";
                break;
            case 'Đã giao hàng':
                $newStaus = "Đơn bị hủy";
                break;
            case 'Đơn bị hủy':
                $newStaus = "Đang giao hàng";
                break;
            default:
                # code...
                break;
        }
        $data = [
            "Status" => $newStaus 
        ];
        $this->model->mUpdate($id, $data);
    }
}
