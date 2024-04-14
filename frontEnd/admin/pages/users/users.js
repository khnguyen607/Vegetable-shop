document.addEventListener('DOMContentLoaded', async () => {
    _init()
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

