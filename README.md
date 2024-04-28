# Giới thiệu về Trang web bán hàng sản phẩm rau củ

## Cấu trúc thư mục dự án:
- backend/  # Đoạn code backend của dự án
  - Core            # Cấu hình nền tảng (vd: tài khoản kết nối Database)
  - Controllers
    - BaseController
    - ...
  - Models   
    - BaseModel
    - ... 
  - www # Dữ liệu public người dùng có thể xem đc (Vd: hình ảnh)
  - index.php # Đoạn mã chính dùng để chỉ định controller nào đc load để thực hiện
  
- frontend/ # Đoạn code backend của dự án
  - admin/      # Giao diện admin
    - assets
    - pages         # Các trang màn hình
    - shared        # Những phần dùng chung
    - index.php       # Điều khiển phần nào được render ra
  - client/     # Giao diện client
    - assets
    - pages         # Các trang màn hình
    - shared        # Những phần dùng chung
    - index.php       # Điều khiển phần nào được render ra
- database/         # Thư mục kiểm thử
- README.md      # Tài liệu hướng dẫn cài đặt và sử dụng

## Chức năng:
- **Giao diện**: Có cả 2 giao diện cho client và admin
- **Phía admin**: Thêm sửa xóa được sản phẩm, mặt hàng cũng như các danh mục của sản phẩm. Quản lý người dùng khách hàng và các đơn đặt hàng của khách
- **Phía client**: Tìm kiếm sản phẩm, xem thông tin các sản phẩm, thêm sản phẩm giỏ hàng và đặt mua sản phẩm.

## Bảng phân công công việc:

| Công việc chính       | Cụ thể  | Nơi làm việc   
|-                      |-        |-  
| **Xây dựng cơ sở dữ liệu** | Thiết kế csdl quan hệ giữa các bảng, các ràng buộc| PhpMyAdmin (sử dụng laragon hoặc xampp)
| **Thiết kế giao diện** (Tìm giao diện trên mạng và cấu trúc nó lại cho phù hợp dự án)  | [Giao diện client](https://jthemes.net/themes/html/organic/index.html)| frontend/client
|                       | [Giao diện admin](https://eres.dexignzone.com/laravel/demo/index)| frontend/admin
| **Xây dựng frontend** | Viết mã kiểm soát router(Chỉ định phần được load) và nhúng các component dùng chung (header, footer, giỏ hàng, đăng ký đăng nhập). Nó nằm ở file index.php của cả admin và client. Các component dùng chung thì nằm trong shared| frontend/admin/index.php; frontend/client/index.php; frontend/client/shared/scripts/init.js
|                       | *Class Helper* (Đoạn mã dùng chung)và *Class CartManager*(Đoạn mã tương tác với giỏ hàng) trong phần shared/scripts/app.js. *thư mục shared nằm ở cả 2 phần admin và client*|frontend/admin/shared/scripts/app.js; frontend/client/shared/scripts/app.js
| **Xây dựng backend**  | Cấu trúc của backend | Trong backend/: Core, BaseController.php, BaseModel.php, backend/index.php
|                       | Dựa vào cấu trúc backend đã xây dựng viết các controller và model cần thiết để tương tác với database                | Các file còn lại trong Controllers/ và Models/
| **Liên kết frontend và backend** (Sử dụng các api đã viết ở backend để nhúng vào giao diện) | Phần admin | Các file *.js trong phần frontend/admin/pages      
|                               | Phần client | Các file *.js trong phần frontend/client/pages      

