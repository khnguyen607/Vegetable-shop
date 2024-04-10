document.addEventListener('DOMContentLoaded', async () => {
    var item = await Helper.fetchData(`product&action=find&id=${Helper.getParameterByName("id")}`)

    document.querySelector(".product_detail_title").textContent = item.Name
    document.querySelector(".product_detail_desc").textContent = item.Subtitle
    document.querySelector(".content_wrap").innerHTML = item.Description
    document.querySelector("._imgProduct").src = item.Img
    document.querySelector("._price").textContent = (item.Price * 1000).toLocaleString("vi-VN") + "₫"
    document.querySelector("._unit").textContent = item.Unit
    document.querySelector(".quantity_input .input_number").addEventListener('change', () => {
        let unitInput = document.querySelector("input.input_number").value
        document.querySelector("._price").textContent = (item.Price * 1000 * unitInput).toLocaleString("vi-VN") + "₫"
    })

    document.querySelector("._addCart").addEventListener("click", () => {
        CartManager.setItem(
            item.Name,
            {
                Price: item.Price,
                Unit: item.Unit,
                Img:item.Img,
                Quantity: document.querySelector("input.input_number").value
            })
        // alert("Thêm giỏ hàng thành công")
        CartManager.show()
    })
    

})
