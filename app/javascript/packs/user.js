function addOrDelete() {
  const attrName = document.getElementsByName("user[unpalatability][]");
  const unpalatabilityNum = attrName.length-2;
  const palatabilityBtn = document.getElementById("unpalatability-btn");
  const fieldInputNum = document.getElementsByClassName("field-input").length-1;
  const formList = document.getElementsByClassName("field-input")[fieldInputNum];
  let formNum = unpalatabilityNum;
  palatabilityBtn.addEventListener("click", function() {
    formNum += 1;
    const formNode = document.createElement("input");
    formNode.setAttribute("autofocus", "true");
    formNode.setAttribute("type", "text");
    formNode.setAttribute("name", "user[unpalatability][]");
    formNode.setAttribute("id", `user_unpalatability-${formNum}`);
    formList.appendChild(formNode);
    const removeBtn = document.createElement("button");
    removeBtn.setAttribute("type", "button");
    removeBtn.setAttribute("id", `delete-btn-${formNum}`);
    removeBtn.innerHTML = '削除';
    formList.appendChild(removeBtn);
    removeBtn.addEventListener("click", function () {
      formNum -= 1;
      formList.removeChild(formNode);
      formList.removeChild(removeBtn);
    });
  });
}
window.addEventListener("load", addOrDelete);