    <?php
    include('db_connect.php');

    if (isset($_GET['id'])) {
        $user = $conn->query("SELECT * FROM users where id =" . $_GET['id']);
        foreach ($user->fetch_array() as $k => $v) {
            $meta[$k] = $v;
        }
    }
    ?>
    <style>
        .face {
            position: absolute;
            top: 90px;
        }

        #black-space.gray-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: black;
            opacity: 0.5;
            z-index: 9999;
            /* Adjust z-index as needed */
            display: none;
            /* Initially hide the black space */
        }
    </style>
    <div class="container-fluid">

        <form action="" id="manage-user" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<?php echo isset($meta['id']) ? $meta['id'] : '' ?>">

            <div class="form-group">
                <label for="picture">Profile Picture</label>
                <input type="file" name="picture" id="picture" class="form-control-file">
            </div>

            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" class="form-control" value="<?php echo isset($meta['name']) ? $meta['name'] : '' ?>" placeholder="Doe John M">
            </div>

            <div class="form-group">
                <label for="username">School ID</label>
                <input type="text" name="username" id="username" class="form-control" value="<?php echo isset($meta['username']) ? $meta['username'] : '' ?>" maxlength="11" oninput="formatSchoolID(this)" placeholder="00-0000-000">
            </div>


            <div class="form-group" id="department-group">
                <label for="department">Department</label>
                <select name="department" id="department" class="form-control" required>
                    <option value="">Select Department</option>
                    <option value="BSIT">College of Information Technology</option>
                    <option value="BSCRIM">College of Criminology</option>
                    <option value="BSA">College of Accountancy</option>
                    <option value="BSHM">College of Hospitality Management</option>
                    <option value="BSTM">College of Tourism Management</option>
                    <option value="BSAIS">College of Accounting Information System</option>
                    <option value="BSMA">College of Management Accountancy</option>
                    <option value="BSBA">College of Business Administration</option>
                    <option value="BSED">College of Elementary Education</option>
                    <option value="BSSD">College of Secondary Education</option>
                    <option value="BSM">College of Midwifery</option>
                    <option value="BSCNCII">College of Caregiving NC II</option>


                </select>
            </div>

            <div class="form-group" id="course-group">
                <label for="course">Course</label>
                <select name="course" id="course" class="form-control" required>
                    <option value="">Select Course</option>
                    <!-- Course options will be dynamically populated based on the selected department -->
                </select>
            </div>



            <div class="form-group">
                <label for="type">User Type</label>
                <select name="type" id="type" class="custom-select">
                    <option value="2" <?php echo isset($meta['type']) && $meta['type'] == 2 ? 'selected' : '' ?>>Students</option>
                    <!-- Add other user type options here -->
                </select>
            </div>
        </form>

        <script>
            function formatSchoolID(input) {
                // Remove all non-digit characters
                var schoolID = input.value.replace(/\D/g, '');

                // Apply the pattern "00-0000-000"
                if (schoolID.length > 2) {
                    schoolID = schoolID.substring(0, 2) + '-' + schoolID.substring(2);
                }
                if (schoolID.length > 7) {
                    schoolID = schoolID.substring(0, 7) + '-' + schoolID.substring(7);
                }

                // Set the formatted value back to the input
                input.value = schoolID;
            }
        </script>

        <script>
            $(document).ready(function() {
                // Function to populate course options based on selected department
                $('#department').change(function() {
                    var department = $(this).val();
                    $('#course').empty();
                    // Populate course options based on the selected department
                    switch (department) {
                        case 'BSIT':
                            $('#course').append('<option value="IT">Bachelor of Science in Information Technology</option>');

                            break;
                        case 'BSCRIM':
                            $('#course').append('<option value="Criminology">Bachelor of Science in Criminology</option>');
                            break;
                        case 'BSA':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Accountancy</option>');
                            break;

                        case 'BSHM':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Hospitality Management</option>');
                            break;

                        case 'BSTM':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Tourism Management</option>');
                            break;

                        case 'BSAIS':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Accounting Information System</option>');
                            break;

                        case 'BSMA':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Business Administration</option>');
                            break;

                        case 'BSED':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Elementary Education</option>');
                            break;

                        case 'BSSD':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Secondary Education</option>');
                            break;

                        case 'BSM':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Midwifery</option>');
                            break;


                        case 'BSCNCII':
                            $('#course').append('<option value="Accounting">Bachelor of Science in Caregiving NC II</option>');
                            break;


                        default:
                            $('#course').append('<option value="">Select Course</option>');
                    }
                });


            });

            // Form submission code remains unchanged
            $('#manage-user').submit(function(e) {
                e.preventDefault();
                start_load()
                var formData = new FormData(this);

                $.ajax({
                    url: 'ajax.php?action=save_user',
                    method: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(resp) {
                        if (resp == 1) {
                            alert_toast("Data successfully saved", 'success')
                            setTimeout(function() {
                                location.reload()
                            }, 1500)
                        }
                    }
                });
            });
        </script>

    </div>