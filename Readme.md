<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128530253/15.2.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T332396)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxCardView - How to implement custom date validation in Batch Edit mode
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t332396/)**
<!-- run online end -->


This example illustrates how to implement custom date validation in Batch Edit mode: <br>1) The <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientCardView_BatchEditCardValidatingtopic">ASPxClientCardView.BatchEditCardValidating</a> event is used to check values on the client.<br>2) The <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxCardView_CardValidatingtopic">ASPxCardView.CardValidating</a> event is used to check values on the server.<br>3) The <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebCardViewBatchEditSettings_AllowValidationOnEndEdittopic">CardViewBatchEditSettings.AllowValidationOnEndEdit</a> property allows switching between validation modes on the client side.  <br><br>If the variation between the <strong>HireDate</strong> and <strong>BirthDate</strong> columns is less than 18, input data is considered invalid and data update is not allowed.


<h3>Description</h3>

&nbsp;

<br/>


