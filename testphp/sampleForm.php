<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>HTML5 Sample Form</title>
    <link rel="stylesheet" media="screen" href="css/styles.css" >
</head>

<body>
	<form class="sample_form" action="getCountryList.php" method="post" name="sample_form">
	<ul>
		<li>
			<h2> Form Title goes here </h2>
			<span class="required_notification">* Denotes Required Field </span>
		</li>

		<li>
			<label for="fname">Name : </label>
			<input type="text" name="fname" placeholder="Sahul Hameed" required/>
		</li>

		<li>
			<label for="dob">Birh Date : </label>
			<input type="date" name="dob" placeholder="31/12/1900" required/>
		</li>

		<li>
			<label for="country">Country : </label>
			<select name="country" required>
			<?php include_once 'countryList.php'; ?>
        		</select>
		</li>

		<li>
    			<label for="email">Email:</label>
			<input type="email" name="email" placeholder="Sahul.Hameed@lntinfotech.com" required/>
			<span class="form_hint">Proper format "name@something.com"</span>
		</li>

		<li>
    			<label for="website">Website:</label>
			<input type="url" name="website" placeholder="http://www.lntinfotech.com" required/>
			<span class="form_hint">Proper format "http://someaddress.com"</span>
		</li>

		<li>
			<label for="message">Message:</label>
			<textarea name="message" cols="40" rows="6" required> </textarea>
		</li>

		<li>
			<button class="submit" type="submit">Submit Form</button>
			<button class="reset" type="reset">Reset Form</button>
		</li>

	</ul>
	</form>

</body>

</html>