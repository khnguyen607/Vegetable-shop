<?php

class ProductController extends BaseController
{
    private $model;

    public function __construct()
    {
        $this->loadModel('ProductModel');
        $this->model = new ProductModel;
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
            'Name'      => $_POST['Name'],
            'Price'      => $_POST['Price'],
            'Subtitle'  => $_POST['Subtitle'],
            'Unit'       => $_POST['Unit'],
            'Description'  => $_POST['Description'],
            'Img'   => $this->saveFile()
        ];
        $productID = $this->model->mInsert($data);

        $selectedCategories = $_POST["Categories"];
        foreach ($selectedCategories as $category) {
            $this->model->insertCategory($productID, $category);
        }

        $nutritionistsData = json_decode($_POST["Nutritionists"], true);
        foreach ($nutritionistsData as $nutritionalID => $value) {
            $this->model->insertNutritional($productID, $nutritionalID, $value);
        }
        echo "true";
    }

    public function update()
    {
        $id = $_GET['id'];
        $data = [
            'name'      => $_POST['name'],
            'location'  => $_POST['location'],
            'img'       => $_POST['img'],
            'capacity'  => $_POST['capacity'],
            'utility'   => $_POST['utility']
        ];
        exit($data);
        $this->model->mUpdate($id, $data);

        header("Location: ../frontend/dashboard.html?tab=mgr__room");
    }

    public function delete()
    {
        $id = $_GET['id'];
        $data = [
            'status' => '0'
        ];
        $this->model->mDelete($id, $data);
        header("Location: ../frontend/dashboard.html?tab=mgr__room");
    }


    public function nutritionalValue()
    {
        $id = $_GET['id'];
        $data = $this->model->mNutritionalValue($id);
        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    public function getCategory()
    {
        $id = $_GET['id'];
        $data = $this->model->mGetCategory($id);
        // Trả về dữ liệu dưới dạng JSON
        header('Content-Type: application/json');
        echo json_encode($data);
    }

    private function saveFile()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['Img'])) {
            // Thư mục đích để lưu trữ tệp tin
            $uploadDirectory = 'www/images/products/';

            // Tên tệp gốc trên máy khách
            $filename = basename($_FILES['Img']['name']);

            // Đường dẫn đầy đủ đến tệp tạm thời trên máy chủ
            $tempFilePath = $_FILES['Img']['tmp_name'];

            // Tạo đường dẫn đầy đủ đến vị trí lưu trữ tệp tin
            $targetFilePath = $uploadDirectory . $filename;
            // Di chuyển tệp tin từ thư mục tạm thời đến thư mục đích
            if (move_uploaded_file($tempFilePath, $targetFilePath)) {
                // Trả về đường dẫn của tệp tin đã được lưu
                return substr($targetFilePath, 4);
            } else {
                echo "Failed to upload file.";
            }
        } else {
            echo "No file uploaded or invalid request.";
        }
        return null;
    }
}
