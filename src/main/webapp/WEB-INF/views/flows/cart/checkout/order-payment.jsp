<%@include file="../../flows-shared/header.jsp" %>

<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="js" value="/resources/js" />
<html>
<head>
	<script src="${js}/validation.js"></script>
</head>
<div class="container">

	<div class="row">
			<!--  To display all the goods -->
			<div class="col-md-6">
				
				<div class="row">
					<c:forEach items="${checkoutModel.cartLines}" var="cartLine">
					<div class="col-xs-12">
						
						<div>
							<h3>${cartLine.product.name}</h3>
							<hr/>
							<h4>Quantity -${cartLine.productCount}</h4>
							<h5>Buying Price - &#8377; ${cartLine.buyingPrice}/-</h5>							
						</div>						
						<hr/>
						<div class="text-right">
							<h3>Grand Total - &#8377; ${cartLine.total}/-</h3>
						</div>						
					</div>
					</c:forEach>
				</div>
				
				
			</div>
			
			<div class="col-md-6">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                    <h3 class="panel-title">
	                        Payment Details
	                    </h3>
	                </div>
	                <div class="panel-body">
	                    <form role="form" name="paymentForm" onsubmit="return paymentvalidation();">
	                    <div class="form-group">
	                        <label for="cardNumber">
	                            CARD NUMBER</label>
	                        <div class="input-group">
								<input type="text" class="form-control" id="card_Number" placeholder="Valid Card Number"
									onfocusout="card_digits(card_Number)" onkeypress='return event.charCode >= 48 && event.charCode <= 57' 
									required autofocus />    
	                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>	
							</div>
	                    </div>
	                    <div class="row">
	                        <div class="col-xs-7 col-md-7">
	                            <div class="form-group">
	                                <label for="expityMonth">EXPIRY DATE</label>
	                                <br/>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expiryMonth" placeholder="MM" onkeypress="validate1()" required />
	                                </div>
	                                <div class="col-xs-6 col-lg-6 pl-ziro">
	                                    <input type="text" class="form-control" id="expiryYear" placeholder="YY" onkeypress="validate2()" required /></div>
	                            </div>
	                        </div>
	                        <div class="col-xs-5 col-md-5 pull-right">
	                            <div class="form-group">
	                                <label for="cvCode">
	                                    CVV</label>
									<input type="password" class="form-control" id="cvCode" placeholder="CVV" onkeypress="validate3()"
									onfocusout="validate4()" required />
	                            </div>
	                        </div>
	                    </div>
	                    </form>
	                </div>
	            </div>
	            <ul class="nav nav-pills nav-stacked">
	                <li class="active"><label><span class="badge pull-right"> &#8377; ${checkoutModel.checkoutTotal}/-</span> &nbsp;Final Payment</label></li>
	            </ul>

	            <br/>
	            <a href="#" class="btn btn-success btn-lg btn-block" role="button" onclick="validation();">Pay</a>
			
			</div>

	</div>
</div>
<%@include file="../../flows-shared/footer.jsp" %>
</html>
<%@include file="paymentvalidation.jsp" %>

