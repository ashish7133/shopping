<script type="text/javascript">
	var d = new Date();
	var n = d.getFullYear();	
	console.log(n);
function validate1(){

		var carderror=document.getElementById("card_Number").value;
		var cardNo=carderror.length;

		if(cardNo==null||cardNo==" ")
		{
			
			alert('Card Number Cant be Empty');
			document.getElementById("card_Number").focus();
			document.getElementById("expiryMonth").value="";
			return false;
		}
		else{
			
			if(cardNo<16){
				alert('Card Number cannot be less than 16');
				document.getElementById("card_Number").focus();
			}
			}
		}
	
function card_digits(num){
	var str = document.getElementById("card_Number").value;
	var results = str.match(/\d{4}/g);
	var final_cc_str = results.join(" ");
	return final_cc_str;
}
			

	function validate2(){
		var montherr=document.getElementById("expiryMonth").value;
		var monthExpiry=montherr.length;
		
		if(monthExpiry==null||monthExpiry==" "){
			alert('Expiry Month cannot be Empty');
			document.getElementById("expiryMonth").focus();
			return false;
		}
		else{
			if(monthExpiry<=1){
				alert('Expiry Month digits Cannot be less than 2');
				document.getElementById("expiryMonth").focus();
			}
		else{
			if(monthExpiry>=3){
				alert('Expiry Month digits cannot be more than 2');
				document.getElementById("expiryMonth").focus();
			}
		else{
			if(montherr<01||montherr>12){
			 	alert('Enter valid Month');
			 	document.getElementById("expiryMonth").focus();
		 		}
			}
			}
		}

	}

	function validate3(){
		var yearerr=document.getElementById("expiryYear").value;
		var yearExpiry=yearerr.length;

		if(yearExpiry==null||yearExpiry==" "){
			alert('Expiry Year digits cannot be Empty');
			document.getElementById("expiryYear").focus();
			return false;
		}

		if(yearExpiry<=3){
			alert('Expiry Year digits Cannot be less than 4');
			document.getElementById("expiryYear").focus();
		}

		if(yearExpiry>=5){
			alert('Expiry Year digits cannot be more than 4');
			document.getElementById("expiryYear").focus();
		}

		else{
			if(yearerr<n||yearerr>n+20){
				alert('Invalid Year Please Check again');
				document.getElementById("expiryYear").focus();
			}
		}
	}

	function validate4(){
		var cvv=document.getElementById("cvCode").value;
		var cvvCode=cvv.length;

		if(cvvCode>3){
			alert('Invalid CVV')
			document.getElementById("cvCode").focus();
		}
	}
	
	function validation() {
		           		alert("Submitting values");
						var carderror=$('#card_Number').val();
						var cardNo=carderror.length;

						var montherr=document.getElementById("expiryMonth").value;
						var monthExpiry=montherr.length;
						
						var yearerr=document.getElementById("expiryYear").value;
						var yearExpiry=yearerr.length;

						var cvv=document.getElementById("cvCode").value;
						var cvvCode=cvv.length;

						if(cardNo==null||cardNo==" ")
						{
							alert('Card Number Cant be Empty');
							document.getElementById("card_Number").focus();
							document.getElementById("expiryMonth").value="";
							return false;
						}
						else
						{
							if(cardNo>=17||cardNo<=15){
							alert('Card Number Cant be More than or less than 16');
							document.getElementById("card_Number").focus();
							}

							else{
								if(monthExpiry==null||monthExpiry==" "){
									alert('Expiry Month cannot be Empty');
									document.getElementById("expiryMonth").focus();
									return false;
								}
								else{
									if(monthExpiry<=1){
										alert('Expiry Month digits Cannot be less than 2');
										document.getElementById("expiryMonth").focus();
									}
								else{
									if(montherr<01||montherr>12){
									 	alert('Enter valid Month');
									 	document.getElementById("expiryMonth").focus();
							 		}
								else{
									if(monthExpiry>=3){
										alert('Expiry Month digits cannot be more than 2');
										document.getElementById("expiryMonth").focus();
								}
								else{
									if(yearExpiry==null||yearExpiry==" "){
										alert('Expiry Year digits cannot be Empty');
										document.getElementById("expiryYear").focus();
										return false;
								}
								else{
									if(yearExpiry<=3){
										alert('Expiry Year digits Cannot be less than 4');
										document.getElementById("expiryYear").focus();
								}
								else{
									if(yearExpiry>=5){
									alert('Expiry Year digits cannot be more than 4');
									document.getElementById("expiryYear").focus();
								}
								else{
									if(yearerr<n||yearerr>n+20){
										alert('Invalid Year Please Check again');
										document.getElementById("expiryYear").focus();
									}
								else{
									if(cvvCode>3){
										alert('Invalid CVV')
										document.getElementById("cvCode").focus();
									}
									else{
									window.location="${flowExecutionUrl}&_eventId_pay";
								}
							}
								}
								}
							}
							}
						}
						}
						}
					}	
					}	
					}	
	
	
	</script>