<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Spring MVC表单处理</title>
</head>
<body>

<h2>Student Information /知识管理系统 </h2>
<form:form method="POST" action="/FormHanding/addStudent">
   <table>
    <tr>
        <td><form:label path="name">名字：</form:label></td>
        <td><form:input path="name" /></td>
    </tr>
    <tr>
        <td><form:label path="age">年龄：</form:label></td>
        <td><form:input path="age" /></td>
    </tr>
    <tr>
        <td><form:label path="id">编号：</form:label></td>
        <td><form:input path="id" /></td>
    </tr>
    <tr>
        <td><form:label path="sex">性别：</form:label></td>
        <td><form:input path="sex" /></td>
    </tr>
    <tr>
    	<td><form:label path="password">密码：</form:label></td>
    	<td><form:password path="password" /></td>
    </tr>
    <tr>
    	<td><form:label path="address">地址：</form:label></td>
    	<td><form:textarea path="address" rows="5" cols="30" /></td>
    </tr>
    <tr>
    	<td><form:label path="country">所在国家：</form:label></td>
    	<td><form:select path="country">
    			<form:option value="NONE" label="请选择。。。" />
    			<form:options items="${countryList}" />
    		</form:select>
    	</td>
    </tr>
    <tr>
    	<td><form:label path="receivePaper">订阅新闻？</form:label></td>
    	<td><form:checkbox path="receivePaper" /></td>
    <tr>
        <td colspan="2">
            <input type="submit" value="提交表单"/>
        </td>
    </tr>
    
</table>  
</form:form>
</body>
</html>