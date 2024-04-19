document.addEventListener('DOMContentLoaded', async () => {
    _init()
    _sendData()
    _searchBy()
})

async function _init() {
    var items = await Helper.fetchData("product")
    var table = document.querySelector("#example5 tbody")
    var itemDiv = table.querySelector("tr").cloneNode(true)
    table.innerHTML = ""
    items.forEach(item => {
        var cloneitemDiv = itemDiv.cloneNode(true)
        cloneitemDiv.querySelector("img").src = Helper.getLink(item.Img)
        cloneitemDiv.querySelector(".text-nowrap").textContent = item.Name
        cloneitemDiv.querySelector(".text-primary").textContent = (item.Price * 1000).toLocaleString("vi-VN") + "₫"
        table.appendChild(cloneitemDiv)
    });
}

async function _sendData() {
    document.querySelector("#exampleModal .modal-footer").addEventListener('click', () => {
        // Dữ liệu form
        const formData = new FormData(document.getElementById('_addProductForm'));
        formData.append('Description', document.querySelector('#ProductDescript').parentElement.querySelector('.ck-content').innerHTML);
        // Thêm tệp tin vào FormData object
        var fileInput = document.querySelector('#ProductImg');
        formData.append('Img', fileInput.files[0]);

        var nutritionalInput = {}
        // Thêm giá trị dinh dưỡng
        document.querySelectorAll(".ProductNutritionistsValue input.form-control").forEach(nutri=>{
            nutritionalInput[nutri.getAttribute("data-nutritional")] = nutri.value
        })
        formData.append('Nutritionists', JSON.stringify(nutritionalInput));
        // Tùy chọn cấu hình cho request
        const requestOptions = {
            method: 'POST', // Phương thức HTTP
            body: formData, // Dữ liệu form
        };

        // URL của endpoint nhận request
        const url = "../../backEnd/?controller=product&action=insert";

        // Gửi request sử dụng fetch
        fetch(url, requestOptions)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json(); // Đọc và trả về dữ liệu JSON từ phản hồi
            })
            .then(data => {
                if (data==true) {
                    window.location.reload();
                }
            })
            .catch(error => {
                console.error('There was a problem with your fetch operation:', error);
                alert("Có lỗi xảy ra")
            });
    })
}

async function _searchBy() {
    document.querySelector(".search-area button").addEventListener('click', ()=>{
        var keyWord = document.querySelector(".search-area input").value.toLowerCase()
        document.querySelectorAll("#example5 tbody tr").forEach(item=>{
            if (item.querySelector("span.text-nowrap").textContent.toLowerCase().includes(keyWord)) {
                item.classList.remove("d-none")
            } else {
                item.classList.add("d-none")
            }
        })
    })
}
