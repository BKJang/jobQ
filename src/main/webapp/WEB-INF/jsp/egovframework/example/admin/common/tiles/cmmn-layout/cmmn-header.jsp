<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />

<!-- jQuery UI -->
<link rel="stylesheet" href="/sample/admin/css/jquery/jquery-ui/jquery-ui.css" />

<!-- Bootstrap CSS -->
<link href="/sample/admin/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- Date picker -->
<link rel="stylesheet" href="/sample/admin/css/bootstrap/bootstrap-datetimepicker.min.css">

<!-- Custom CSS -->
<link href="/sample/admin/css/custom/style.css" rel="stylesheet">

<!-- Widgets stylesheet -->
<link href="/sample/admin/css/custom/widgets.css" rel="stylesheet">

<!-- Favicon - 브라우저 주소창옆에 아이콘 넣어줌 -->
<!-- <link rel="/sample/admin/shortcut icon" href="#"> -->

<!-- jqGrid -->
<link rel="stylesheet" type="text/css" href="/sample/admin/css/jquery/jqgrid/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="/sample/admin/css/jquery/jqgrid/ui.jqgrid-bootstrap.css" />
<link rel="stylesheet" type="text/css" href="/sample/admin/css/jquery/jqgrid/ui.jqgrid-bootstrap-ui.css" />

<!-- DataTables -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-3.1.3/pdfmake-0.1.27/dt-1.10.15/af-2.2.0/b-1.3.1/b-colvis-1.3.1/b-html5-1.3.1/datatables.min.css"/>

<!-- Morris Chart -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">

<!-- Font awesome CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<!-- Dropzone CSS -->
<link rel="stylesheet" href="/sample/admin/css/jquery/plugin/dropzone.css" />

<!-- bxSlider CSS file -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.12/jquery.bxslider.css" rel="stylesheet" />

<style>
.ui-jqgrid.ui-widget.ui-widget-content.ui-corner-all {
	width: 100% !important;
}

.ui-jqgrid-view {
	width: 100% !important;
}

.ui-jqgrid-hdiv {
	width: 100% !important;
}

.ui-jqgrid .ui-jqgrid-hbox {
	width: 100% !important;
	padding: 0 !important;
}

.ui-jqgrid-htable {
	width: 100% !important;
}

.ui-jqgrid-bdiv {
	width: 100% !important;
}

.ui-jqgrid-btable {
	width: 100% !important;
}

.ui-jqgrid-pager {
	width: 100% !important;
}

.ui-jqgrid .ui-jqgrid-htable th div {
	height: auto;
	overflow: hidden;
	padding-right: 2px;
	padding-left: 2px;
	padding-top: 4px;
	padding-bottom: 4px;
	position: relative;
	vertical-align: text-top;
	white-space: normal !important;
}

.morris-hover {
  position:absolute;
  z-index:1000;
}

.morris-hover.morris-default-style {     border-radius:10px;
  padding:6px;
  color:#666;
  background:rgba(255, 255, 255, 0.8);
  border:solid 2px rgba(230, 230, 230, 0.8);
  font-family:sans-serif;
  font-size:12px;
  text-align:center;
}

.morris-hover.morris-default-style .morris-hover-row-label {
  font-weight:bold;
  margin:0.25em 0;
}

.morris-hover.morris-default-style .morris-hover-point {
  white-space:nowrap;
  margin:0.1em 0;
}

svg { width: 100%; }

</style>

<title>jobQ</title>