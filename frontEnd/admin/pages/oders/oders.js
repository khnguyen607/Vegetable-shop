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
        cloneitemDiv.querySelector("._orderID").textContent = "HD"+item.ID
        cloneitemDiv.querySelector("._orderName").textContent = item.Name
        cloneitemDiv.querySelector("._orderDate").textContent = item.Date
        cloneitemDiv.querySelector("._orderTotalPrice").textContent = (item.TotalPrice * 1000).toLocaleString("vi-VN") + "₫"
        setStatus(cloneitemDiv.querySelector("._orderStatus"), item.Status, item.ID)

        cloneitemDiv.querySelector("._btnDetail").addEventListener('click', async ()=>{
            var modal = document.querySelector("#exampleModal")
            modal.querySelector("h4._orderID").textContent = "Mã hóa đơn: HD" + item.ID
            var order = await Helper.fetchData("order&action=getAllsFK")
            
        })
        table.appendChild(cloneitemDiv)
    });
}

async function setStatus(_orderStatus, itemStatus, id) {
    var nextStatus = null
    var changeStatus = _orderStatus.parentNode.querySelector("._buttonChangeStatus .btn-rounded")
    var status = _orderStatus.querySelector("span")
    changeStatus.addEventListener('click', async () => {
        await Helper.fetchData(`order&action=changeStatus&id=${id}&currentStatus=${itemStatus}`)
        itemStatus = nextStatus
        _changeStatus(itemStatus)
    })
    _changeStatus(itemStatus)
    function _changeStatus(value) {
        status.textContent = value
        let colors = ["warning", "primary", "secondary", "success", "danger"]
        for (const color of colors) {
            status.classList.remove("text-"+color)
            changeStatus.classList.add("btn-"+color)
        }

        switch (value) {
            case "Chờ duyệt":
                status.classList.add("text-warning")
                changeStatus.textContent = "Duyệt đơn"
                nextStatus = "Đã duyệt"
                changeStatus.classList.add("btn-primary")
                break;
            case "Đã duyệt":
                status.classList.add("text-primary")
                changeStatus.textContent = "Giao hàng"
                nextStatus = "Đang giao hàng"
                changeStatus.classList.add("btn-secondary")
                break;
            case "Đang giao hàng":
                status.classList.add("text-secondary")
                changeStatus.textContent = "Tới nơi"
                nextStatus = "Đã giao hàng"
                changeStatus.classList.add("btn-info")
                break;
            case "Đã giao hàng":
                status.classList.add("text-success")
                changeStatus.textContent = "Hủy đơn"
                nextStatus = "Đơn bị hủy"
                changeStatus.classList.add("btn-danger")
                break;
            case "Đơn bị hủy":
                status.classList.add("text-danger")
                changeStatus.textContent = "Giao lại"
                nextStatus = "Đang giao hàng"
                changeStatus.classList.add("btn-dark")
                break;
            default:
                status.textContent = "Trạng thái không xác định"
                break;
        }
    }

}
  