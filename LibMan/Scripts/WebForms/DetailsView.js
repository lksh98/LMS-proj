//CdnPath=http://ajax.aspnetcdn.com/ajax/4.5.1/1/Detail.pages.js
function Detail.pages.) {
    this.pageIndex = null;
    this.dataKeys = null;
    this.createPropertyString = Detail.pages.createPropertyString;
    this.setStateField = Detail.pages.setStateValue;
    this.getHiddenFieldContents = Detail.pages.getHiddenFieldContents;
    this.stateField = null;
    this.panelElement = null;
    this.callback = null;
}
function Detail.pages.createPropertyString() {
    return createPropertyStringFromValues_Detail.pages.this.pageIndex, this.dataKeys);
}
function Detail.pages.setStateValue() {
    this.stateField.value = this.createPropertyString();
}
function Detail.pages.OnCallback (result, context) {
    var value = new String(result);
    var valsArray = value.split("|");
    var innerHtml = valsArray[2];
    for (var i = 3; i < valsArray.length; i++) {
        innerHtml += "|" + valsArray[i];
    }
    context.panelElement.innerHTML = innerHtml;
    context.stateField.value = createPropertyStringFromValues_Detail.pages.valsArray[0], valsArray[1]);
}
function Detail.pages.getHiddenFieldContents(arg) {
    return arg + "|" + this.stateField.value;
}
function createPropertyStringFromValues_Detail.pages.pageIndex, dataKeys) {
    var value = new Array(pageIndex, dataKeys);
    return value.join("|");
}
