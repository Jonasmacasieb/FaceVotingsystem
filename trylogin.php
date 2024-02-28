<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Voting Management System</title>

  <?php include('./header.php'); ?>
  <?php
  session_start();
  if (isset($_SESSION['login_id']))
    header("location:index.php?page=home");
  ?>

  <style>
    * {
      padding: 0px;
      margin: 0px;
      font-family: arial;
    }

    #login {
      width: 100%;
      height: 100vh;
      background-image: url("newbglogo.jpeg");
      background-size: cover;
      background-repeat: no-repeat;
      position: absolute;
    }

    .center {
      width: 90%;
      /* Adjusted width for mobile */
      max-width: 380px;
      /* Added max-width for better scaling */
      height: auto;
      margin: 0 auto;
      margin-top: 15%;
      /* Adjusted margin for mobile */
      background-color: #fff;
      box-shadow: 2px 2px 16px 0px #757575;
      padding: 40px;
      border-radius: 24px;
      position: relative;
    }

    .center h2 {
      font-size: 25px;
      text-align: center;
      color: #000;
      padding-bottom: 25px;
      padding-top: 30px;
      font-family: 'Times New Roman', serif;
    }

    .its:hover {
      opacity: 0.8;
    }

    .fl {
      width: 100%;
    }

    .itpw {
      width: 100%;
      border: none;
      border-radius: 24px;
      font-size: 1rem;
      font-family: 'Raleway', sans-seriff;
      background-color: gainsboro;
      padding: 13px 10px;
      margin: 5px 0px;
    }

    .its {
      background-color: #E0E0E0;
      background-image: linear-gradient(19deg, #21D4FD 0%, #B721FF 100%);
      width: 100%;
      color: white;
      border: none;
      margin-top: 35px;
      cursor: pointer;
      padding: 10px;
      font-family: 'Raleway', sans-seriff;
      font-size: 1.3rem;
      font-weight: bold;
      border-radius: 24px;
      transition: 0.25s;
    }

    .itpw:focus {
      border-bottom: 3px #21D4FD solid;
      color: #004d40
    }

    .its:hover,
    .its:focus {
      opacity: 0.7;
      cursor: pointer;
    }

    .center p {
      margin: 20px 0;
      text-align: center;
      font-size: 14px;
    }

    .center p a {
      color: #757575;
    }

    .logo {
      position: absolute;
      top: -80px;
      left: 50%;
      transform: translateX(-50%);
    }

    /* CSS for Mobile Phones */
    @media screen and (max-width: 480px) {
      #login {
        display: flex;
        /* Use flexbox */
        justify-content: center;
        /* Center content horizontally */
        align-items: center;
        /* Center content vertically */
        height: 100vh;
        /* Adjusted height for full viewport height */
      }

      .center {
        width: 90%;
        max-width: 280px;
        /* Adjusted max-width for smaller screens */
        margin-top: 30%;
        /* Adjusted margin for smaller screens */
        padding: 30px;
        /* Adjusted padding for smaller screens */
      }

      .center h2 {
        font-size: 20px;
        /* Adjusted font size for smaller screens */
        padding-top: 20px;
        /* Adjusted padding for smaller screens */
        padding-bottom: 20px;
        /* Adjusted padding for smaller screens */
      }

      .logo img {
        width: 100px;
        /* Adjusted logo size for smaller screens */
        height: 100px;
        /* Adjusted logo size for smaller screens */
      }

      .itpw {
        padding: 10px;
        /* Adjusted padding for smaller screens */
        font-size: 14px;
        /* Adjusted font size for smaller screens */
      }

      .its {
        margin-top: 25px;
        /* Adjusted margin for smaller screens */
        padding: 8px;
        /* Adjusted padding for smaller screens */
        font-size: 1rem;
        /* Adjusted font size for smaller screens */
      }

      .logo {
        top: -90px;
        /* Adjusted position for smaller screens */
      }
    }

    /* CSS for Medium-sized Devices (e.g., Tablets) */
    @media screen and (max-width: 768px) {
      .center {
        margin-top: 20%;
        /* Adjusted margin for medium-sized devices */
      }
    }

    /* CSS for Large-sized Devices */
    @media screen and (min-width: 1200px) {
      .center {
        margin-top: 10%;
        /* Adjusted margin for larger devices */
      }
    }
  </style>
</head>

<body>

  <div id="login">

    <div class="center">
      <div class="logo">
        <img src="perps logo.png" style="width:150px; height:150px;" alt="">
      </div>
      <h2>Voting Management system with Facial Recognition </h2>
      <!-- <h2>for Perpetual Help College of Pangasinan</h2> -->
      <form id="login-form" class="fl" action="" method="post">
        <input class="itpw" type="text" name="username" placeholder="School ID" maxlength=11><br>
        <input class="its" type="submit" name="login" value="Proceed">
      </form>
    </div>
  </div>

  <script>
    $('#login-form').submit(function(e) {
      e.preventDefault()
      $('#login-form button[type="button"]').attr('disabled', true).html('Logging in...');
      if ($(this).find('.alert-danger').length > 0)
        $(this).find('.alert-danger').remove();
      $.ajax({
        url: 'ajax.php?action=login',
        method: 'POST',
        data: $(this).serialize(),
        error: err => {
          console.log(err)
          $('#login-form button[type="button"]').removeAttr('disabled').html('Login');
        },
        success: function(resp) {
          if (resp == 2) {
            location.href = 'voting.php';
          } else {
            $('#login-form').prepend('<div class="alert alert-danger">School ID is Incorrect</div>')
            $('#login-form button[type="button"]').removeAttr('disabled').html('Login');
          }
        }
      })
    })
  </script>
</body>

</html>