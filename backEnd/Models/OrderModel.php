<?php

class OrderModel extends BaseModel
{
    const TABLE = 'orders';

    public function mAlls($select = ['*'])
    {
        return $this->bmAlls(self::TABLE, $select);
    }

    public function mFind($id)
    {
        return $this->bmFind(self::TABLE, $id);
    }

    public function mInsert($data)
    {
        return $this->bmInsert(self::TABLE, $data);
    }

    public function mUpdate($id, $data)
    {
        return $this->bmUpdate(self::TABLE, $id, $data);
    }

    public function mDelete($id)
    {
        return $this->bmDelete(self::TABLE, $id);
    }

    public function mGetAllsFK()
    {
        $sql = "SELECT orders.*, users.Name FROM orders INNER JOIN users ON orders.userID = users.ID";
        $query = $this->_query($sql);
        $data = [];

        while ($row = mysqli_fetch_assoc($query)) {
            array_push($data, $row);
        }

        return $data;
    }
}
