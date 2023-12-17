//CdnPath=http://ajax.aspnetcdn.com/ajax/4.5.1/1/Gri.pages.js
function Gri.pages.) {
    this.pageIndex = null;
    this.sortExpression = null;
    this.sortDirection = null;
    this.dataKeys = null;
    this.createPropertyString = Gri.pages.createPropertyString;
    this.setStateField = Gri.pages.setStateValue;
    this.getHiddenFieldContents = Gri.pages.getHiddenFieldContents;
    this.stateField = null;
    this.panelElement = null;
    this.callback = null;
}
function Gri.pages.createPropertyString() {
    return createPropertyStringFromValues_Gri.pages.this.pageIndex, this.sortDirection, this.sortExpression, this.dataKeys);
}
function Gri.pages.setStateValue() {
    this.stateField.value = this.createPropertyString();
}
function Gri.pages.OnCallback (result, context) {
    var value = new String(result);
    var valsArray = value.split("|");
    var innerHtml = valsArray[4];
    for (var i = 5; i < valsArray.length; i++) {
        innerHtml += "|" + valsArray[i];
    }
    context.panelElement.innerHTML = innerHtml;
    context.stateField.value = createPropertyStringFromValues_Gri.pages.valsArray[0], valsArray[1], valsArray[2], valsArray[3]);
}
function Gri.pages.getHiddenFieldContents(arg) {
    return arg + "|" + this.stateField.value;
}
function createPropertyStringFromValues_Gri.pages.pageIndex, sortDirection, sortExpression, dataKeys) {
    var value = new Array(pageIndex, sortDirection, sortExpression, dataKeys);
    return value.join("|");
}
