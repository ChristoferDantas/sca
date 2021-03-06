<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="${rootUrl}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="${rootUrl}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${rootUrl}/js/formulario.js"
	charset="utf-8"></script>
<link rel="stylesheet" type="text/css"
	href="${rootUrl}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${rootUrl}/css/egresso.css" />
<title>Formulário de Avaliação de Curso por Egresso</title>
</head>
<body>
	<form method="POST" action="${rootUrl}/avaliacaoEgresso/avaliaEgresso">
		<div class="row">
			<div class="col-md-8 form">
				<img src="${rootUrl}/images/logo-cefet.jpg">
				<h3 style="margin-left: 100px; font-weight: bold;">PROGRAMA DE
					ACOMPANHAMENTO DE EGRESSOS</h3>
				<h4 style="margin-left: 350px; font-weight: bold;">Graduação</h4>
				<hr />
				<c:if test="${requestScope.questoes == null}">
					<h3>Não existem questões a serem respondidas.</h3>
				</c:if>

				<c:if test="${requestScope.questoes != null}">

					<c:forEach items="${requestScope.questoes}" var="questao"
						varStatus="i">
						<c:if test="${i.index+1 == 2}">
							<div id="divHideSlice">
						</c:if>
						<div class="question-box" id="box-${i.index+1}">
							<div class="question-wrapper">
								<c:choose>
									<c:when test="${i.index+1 == 7}">
										<p class="question">${i.index + 1})&nbsp;${questao.quesito}</p>
										<div style="margin-left: 30px;">
											<input type="text" name="resp-especialidade"
												class="form-control" style="width: 400px;" />
										</div>
									</c:when>

									<c:when test="${i.index+1 != 7}">
										<p class="question">${i.index + 1})&nbsp;${questao.quesito}</p>
										<c:forEach items="${questao.alternativas}"
											var="alternativaDto" varStatus="j">
											<div style="margin-left: 30px;">
												<div class="radio">
													<label> <input type="radio"
														name="question-${i.index+1}" value="${alternativaDto.id}" />
														${alternativaDto.alternativa} <c:if
															test="${alternativaDto.id == 37}">
															<input type="text" name="resp-10" class="form-control"
																style="width: 260px;" />
														</c:if> <c:if test="${alternativaDto.id == 55}">
															<input type="text" name="resp-area" class="form-control"
																style="width: 260px;" />
														</c:if>


													</label>
												</div>
											</div>
										</c:forEach>
									</c:when>
								</c:choose>
							</div>
						</div>
						<br />
						<br />
						<c:if test="${i.index+1 == 12}">
			</div>
			</c:if>

			</c:forEach>

			<br /> <br />

			<div class="checkbox" style="margin-left: 200px">
				<label> <input type="checkbox" id="chkAllow">
					Autorizo a divulgação dos meus contatos pessoais junto às empresas.
				</label>
			</div>

			<br /> <br />
			<div style="margin-left: 250px;">
				<div style="float: left; margin-right: 30px;">
					<button type="submit" class="btn btn-primary" id="btnSend">
						<span class="glyphicon glyphicon-ok"></span> Confirmar envio
					</button>
				</div>
				<div style="float: left;">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-remove"></span> Limpar respostas
					</button>
				</div>
			</div>
			</c:if>


			<br /> <br /> <br /> <br />

		</div>
		</div>
	</form>
</body>
</html>