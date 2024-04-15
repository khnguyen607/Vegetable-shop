document.addEventListener('DOMContentLoaded', async () => {
    _init()
    _sendData()
})

async function _init() {
    var items = await Helper.fetchData("user")
    var table = document.querySelector("#example5 tbody")
    var itemDiv = table.querySelector("tr").cloneNode(true)
    table.innerHTML = ""
    items.forEach(item => {
        var cloneitemDiv = itemDiv.cloneNode(true)
        cloneitemDiv.querySelector(".text-nowrap").textContent = item.Name
        cloneitemDiv.querySelector("._userTier").textContent = item.Tier
        cloneitemDiv.querySelector("._userRole").textContent = (item.Role == 1) ? "Quản trị viên" : "Khách"
        cloneitemDiv.querySelector("._userUserName").textContent = item.UserName
        table.appendChild(cloneitemDiv)
    });
}

async function _sendData() {
    document.querySelector("#exampleModal .modal-footer").addEventListener('click', () => {
        // Dữ liệu form
        const formData = new FormData(document.getElementById('_addUserForm'));

        // Tùy chọn cấu hình cho request
        const requestOptions = {
            method: 'POST', // Phương thức HTTP
            body: formData, // Dữ liệu form
        };

        // URL của endpoint nhận request
        const url = "../../backEnd/?controller=user&action=insert";

        // Gửi request sử dụng fetch
        fetch(url, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Đọc và trả về dữ liệu JSON từ phản hồi
            })
            .then(data => {
                console.log('Response data:', data); // Xử lý dữ liệu phản hồi
            })
            .catch(error => {
                console.error('There was a problem with your fetch operation:', error);
            });
    })
}
