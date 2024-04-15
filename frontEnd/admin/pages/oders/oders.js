document.addEventListener('DOMContentLoaded', async () => {
    _init()
})

async function _init() {
    var items = await Helper.fetchData("order&action=getAllsFK")
    var table = document.querySelector("#example5 tbody")
    var itemDiv = table.querySelector("tr").cloneNode(true)
    table.innerHTML = ""
    items.forEach(item => {
        var cloneitemDiv = itemDiv.cloneNode(true)
        cloneitemDiv.querySelector("._orderName").textContent = item.Name
        cloneitemDiv.querySelector("._orderDate").textContent = item.Date
        cloneitemDiv.querySelector("._orderTotalPrice").textContent = (item.TotalPrice * 1000).toLocaleString("vi-VN") + "₫"
        setStatus(cloneitemDiv.querySelector("._orderStatus"), item.Status)
        table.appendChild(cloneitemDiv)
    });
}

async function setStatus(_orderStatus, itemStatus) {
    var status = _orderStatus.querySelector("span")
    var changeStatus =  _orderStatus.parentNode.querySelector("._buttonChangeStatus .btn-rounded")
    status.textContent = itemStatus
    switch (itemStatus) {
        case "Chờ duyệt":
            status.classList.add("text-warning")
            changeStatus.textContent="Duyệt đơn"
            changeStatus.classList.add("btn-primary")
            break;
        case "Đã duyệt":
            status.classList.add("text-primary")
            changeStatus.textContent="Giao hàng"
            changeStatus.classList.add("btn-secondary")
            break;
        case "Đang giao hàng":
            status.classList.add("text-secondary")
            changeStatus.textContent="Tới nơi"
            changeStatus.classList.add("btn-info")
            break;
        case "Đã giao hàng":
            status.classList.add("text-success")
            changeStatus.textContent="Hủy đơn"
            changeStatus.classList.add("btn-danger")
            break;
        case "Đơn bị hủy":
            status.classList.add("text-danger")
            changeStatus.textContent="Giao lại"
            changeStatus.classList.add("btn-dark")
            break;
        default:
            status.textContent = "Trạng thái không xác định"
            break;
    }
}
