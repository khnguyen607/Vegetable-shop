
document.addEventListener('DOMContentLoaded', async () => {
    // Đặt các layouts
    await _getLayouts()
    // Đặt tiêu đề
    _setTitle()
    // Khởi tạo loginModal
    _loginModal()
    // Hiển thị sản phẩm đang có trong cart
    CartManager.show()
})

async function _getLayouts() {
    try {
        // Get components
        var components = document.createElement("div")
        components.innerHTML = await Helper.fetchHTML("./shared/components/layout.html");
        // Set Header
        document.querySelector("header.header_section.header_1").innerHTML = components.querySelector("header.header_section.header_1").innerHTML;
        // Set sidebar
        document.querySelector("section.sidebar_section").innerHTML = components.querySelector("section.sidebar_section").innerHTML;
        // Set footer
        document.querySelector("footer.footer_section.position-relative").innerHTML = components.querySelector("footer.footer_section.position-relative").innerHTML;
        // Set loginModal
        document.querySelector("#collapseExample .dropdown_content").innerHTML = ""
        if (Helper.getCookie("user_id")) {
            // Khởi tạo myOrderModal
            _myOrderModal()
            var user = await Helper.fetchData("user&action=find&id=" + Helper.getCookie("user_id"))
            document.querySelector("#collapseExample .dropdown_content").innerHTML = `
                <div class="profile_info clearfix">
                <div class="user_thumbnail">
                    <img src="assets/images/meta/meta1.png" alt="image_not_found">
                </div>
                <div class="user_content">
                    <h4 class="user_name">${user.Name}</h4>
                    <span class="user_title">Hạng: ${user.Tier}</span>
                </div>
                </div>
                <ul class="settings_options ul_li_block clearfix">
                    <li><a style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#_myOrderModal"><i class="fas fa-user-circle"></i> Đơn hàng của tôi</a></li>
                    <li><a href="../../backend/?controller=user&action=logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                </ul>
            `
        } else {
            document.querySelector("#collapseExample .dropdown_content").innerHTML = `
                <div class="profile_info clearfix">
                    <div class="user_thumbnail">
                        <img src="assets/images/meta/meta1.png" alt="image_not_found">
                    </div>
                    <div class="user_content">
                        <h4 class="user_name">__Khách__</h4>
                    </div>
                </div>
                <ul class="settings_options ul_li_block clearfix text-center">
                    <li><button style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#_loginModal" class="btn btn-primary rounded-pill">Đăng nhập</button></li>
                </ul>
            `
        }
    } catch (error) {
        console.error('Error loading HTML:', error);
    }
}

function _setTitle() {
    function getParameterFromURL(parameterName) {
        const urlParams = new URLSearchParams(window.location.search);
        return urlParams.get(parameterName);
    }

    const paramValue = getParameterFromURL('page');
    var title = "Trang chủ"
    switch (paramValue) {
        case "products":
            title = "Danh sách sản phẩm"
            document.querySelector('#navbarSupportedContent a[href="./?page=products"]').classList.add("active")
            break;
        case "productDetail":
            title = "Chi tiết sản phẩm"
            document.querySelector('#navbarSupportedContent a[href="./?page=products"]').classList.add("active")
            break;
        case "blogs":
            title = "Danh sách bài viết"
            document.querySelector('#navbarSupportedContent a[href="./?page=blogs"]').classList.add("active")
            break;
        case "blogDetail":
            title = "Chi tiết bài viết"
            document.querySelector('#navbarSupportedContent a[href="./?page=blogs"]').classList.add("active")
            break;
        case "contact":
            title = "Liên hệ với chúng tôi"
            document.querySelector('#navbarSupportedContent a[href="./?page=contact"]').classList.add("active")
            break;
        default:
            document.querySelector('#navbarSupportedContent a[href="./"]').classList.add("active")
            break;
    }
    document.querySelector("head title").textContent = title
}

async function _loginModal() {
    try {
        // Get loginModal
        var loginModal = document.createElement("div")
        loginModal.innerHTML = await Helper.fetchHTML("./shared/components/login.html");
        // Set Modal
        document.querySelector("body").appendChild(loginModal)

        document.getElementById("signupLink").addEventListener("click", function (event) {
            event.preventDefault();
            $('#_loginModal').modal('hide');
            $('#_signupModal').modal('show');
        });

        document.getElementById("loginLink").addEventListener("click", function (event) {
            event.preventDefault();
            $('#_signupModal').modal('hide');
            $('#_loginModal').modal('show');
        });

    } catch (error) {
        console.error('Error loading HTML:', error);
    }

    // Các trạng thái đăng nhập, đăng ký
    if (Helper.getParameterByName("loginSuccfully")) {
        alert("Đăng nhập thành công")
    } else if (Helper.getParameterByName("loginFailed")) {
        alert("Đăng nhập thất bại")
    } else if (Helper.getParameterByName("signupSuccfully")) {
        alert("Đăng ký thành công")
    } else if (Helper.getParameterByName("signupFailed")) {
        alert("Đăng ký thất bại")
    } else if (Helper.getParameterByName("logoutFailed")) {
        alert("Đăng xuất thành công")
    }
}

async function _myOrderModal() {
    try {
        // Get myOrderModal
        var myOrderModal = document.createElement("div")
        myOrderModal.innerHTML = await Helper.fetchHTML("./shared/components/myOrders.html");
        var items = await Helper.fetchData("order&action=getOrderForUser&userID=" + Helper.getCookie("user_id"))
        console.log(items);
        myOrderModal.querySelector(".modal-body .list-group").innerHTML = ""
        items.forEach(item => {
            var orderDetail = document.createElement("a")
            orderDetail.classList.add("list-group-item", "list-group-item-action")
            orderDetail.innerHTML = `
                <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">Đơn hàng: HD${item.orderID}</h5>
                <small>Thời gian đặt hàng: ${item.Date}</small>
                </div>
                <p class="mb-1">Tổng tiền: ${(item.TotalPrice * 1000).toLocaleString("vi-VN")}₫</p>
                <small>Trạng thái: ${item.Status}</small>
            `
            myOrderModal.querySelector(".modal-body .list-group").appendChild(orderDetail)
        });
        // Set Modal
        document.querySelector("body").appendChild(myOrderModal)
    } catch (error) {
        console.error('Error loading HTML:', error);
    }

}