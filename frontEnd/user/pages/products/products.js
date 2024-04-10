document.addEventListener('DOMContentLoaded', async () => {
    var dataList = document.querySelector("#grid_layout .row.g-4")
    var data = document.querySelector("#grid_layout .row.g-4 .col-sm-6").cloneNode(true)
    dataList.innerHTML = ""
    var items = await Helper.fetchData("product")
    items.forEach(item => {
        let cloneData = data.cloneNode(true)
        cloneData.querySelector(".product_title a").textContent = item.Name
        cloneData.querySelector("span.sale_price").textContent = (item.Price*1000).toLocaleString('vi-VN') + "₫"
        cloneData.querySelector(".product_image").href += `&id=${item.ID}`
        cloneData.querySelector(".product_image img").src = item.Img
        dataList.appendChild(cloneData)
    });
})