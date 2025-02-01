function toggleForm(formId) {
    console.log("Toggling form:", formId);
    document.querySelector('.login-form.active').classList.remove('active');
    document.getElementById(formId).classList.add('active');
}

function handleLogin(userType) {
    const id = userType === "student" ? document.getElementById("studentId").value : document.getElementById("teacherId").value;
    const password = userType === "student" ? document.getElementById("studentPassword").value : document.getElementById("teacherPassword").value;

    fetch('php/login.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ userType, id, password })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            if (userType === "student") {
                window.location.href = 'welcome.html';
            } else {
                window.location.href = 'teacher_welcome.html';
            }
        } else {
            alert('Invalid login credentials');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while logging in.');
    });
}
