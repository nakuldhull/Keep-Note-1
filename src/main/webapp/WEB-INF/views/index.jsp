<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<style>
		.main-form{
			margin-top:35px;
			width:450px;
			height:300px;
			margin-left:auto;
			margin-right:auto;
		}
		.table-form{
			width:1050px;
			margin-left:auto;
			margin-right:auto;
			
		}
		.table-form{
			text-align:center;
		}
		.table-form table a{
			text-decoration:none;
		}
		.table-form table td{
			border-top:none;
		}
		h2{
			text-align:center;
			padding-top:14px;
			color: tomato;
		}
	</style>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" 
	 rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" 
	 crossorigin="anonymous">
</head>
<body>
	<h2 class="display-6">KEEP NOTE</h2>
	<hr/>
	<div class="main-form">
		<form method="POST" action="<c:url value="/saveNote"/>">
		  <div class="form-group mb-3">
		    <label for="noteId">Enter your ID</label>
		    <input type="text" class="form-control" id="idInput" name="noteId" value="${notes.noteId }">
		  </div>
		  <div class="form-group mb-3">
		    <label for="noteTitle">Enter the Title</label>
		    <input type="text" class="form-control" id="titleInput"name="noteTitle"value="${notes.noteTitle }">
		  </div>
		  <div class="form-group mb-3" >
		    <label for="noteContent">Enter the Content of your note</label>
		    <input type="text" class="form-control" id="contentInput" name="noteContent" value="${notes.noteContent }">
		  </div>
		   <div class="form-group mb-3" >
		    <label for="noteStatus">Enter your Status</label>
		    <input type="text" class="form-control" id="statusInput" name="noteStatus" value="${notes.noteStatus }">
		  </div>
		  
		  <c:if test="${! empty notes.noteId}">
		  	<button type="submit" class="btn btn-info">Update User</button>
		  </c:if>
		  <c:if test="${empty notes.noteId}">
		  	<button type="submit" class="btn btn-success">Add User</button>
		  </c:if>
		  
		</form>
	</div>

	
	<div class="table-form">
		<table class="table table-striped">
	  <thead>
	    <tr class="table-warning">
	      <th scope="col">NoteId</th>
	      <th scope="col">NoteTitle</th>
	      <th scope="col">NoteContent</th>
	      <th scope="col">NoteStatus</th>
	      <th scope="col">CreatedAt</th>
	      <th scope="col">Action</th>
	    </tr>
	  </thead>
	  <tbody>
	  <c:if test="${!empty notesList }">
	  	<c:forEach var="note" items="${notesList}">
		      <tr class="table-primary">
		      <th>${note.noteId}</th>
		      <td>${note.noteTitle}</td>
		      <td>${note.noteContent}</td>
		      <td>${note.noteStatus}</td>
		      <td>${note.createdAt}</td>
		      <td>
		      		<a href="<c:url value="/updateNote/${note.noteId}"/>">
									<button type="button" class="btn btn-primary">Update</button>
								</a>
		      		<form action="<c:url value="/deleteNote/${note.noteId }"/>">
									<button type="submit" class="btn btn-danger">Delete</button>
								</form>
		      </td>
		    </tr>
		</c:forEach>
	  	  </tbody>
	  </c:if>
	</table>
	</div>
</body>
</html>
