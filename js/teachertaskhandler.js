document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('edit-attendance-btn').addEventListener('click', function() {
        const form = document.getElementById('attendance-form');
        form.classList.toggle('show');
    });
});

function submitAttendanceForm() {
    const year = document.getElementById('year').value;
    const department = document.getElementById('department').value;
    const division = document.getElementById('division').value;

    console.log('Year:', year); // Log selected year
    console.log('Department:', department); // Log selected department
    console.log('Division:', division); // Log selected division

    if (!year || !department || !division) {
        alert('Please select all fields');
        return;
    }

    const form = document.getElementById('attendance-form');
    form.classList.remove('show');

    fetch('php/get_students.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ year, department, division })
    })
    .then(response => response.json())
    .then(data => {
        console.log('Student Data:', data); // Log received student data

        const studentList = document.getElementById('student-list');
        studentList.innerHTML = '';

        if (data.students && data.students.length > 0) {
            data.students.forEach((student, index) => {
                const studentRow = document.createElement('div');
                studentRow.className = 'student-row';

                const studentInfo = document.createElement('div');
                studentInfo.className = 'student-info';
                const studentName = `${student.name}`;
                studentInfo.textContent = `${index + 1}. ${studentName}`;

                const buttonsDiv = document.createElement('div');
                buttonsDiv.className = 'attendance-buttons';

                const presentBtn = document.createElement('button');
                presentBtn.className = 'present-btn';
                presentBtn.textContent = 'Present';

                const absentBtn = document.createElement('button');
                absentBtn.className = 'absent-btn';
                absentBtn.textContent = 'Absent';

                presentBtn.onclick = () => toggleAttendance(presentBtn, absentBtn, student.id, studentName, year, department, division, true);
                absentBtn.onclick = () => toggleAttendance(absentBtn, presentBtn, student.id, studentName, year, department, division, false);

                buttonsDiv.appendChild(presentBtn);
                buttonsDiv.appendChild(absentBtn);

                studentRow.appendChild(studentInfo);
                studentRow.appendChild(buttonsDiv);
                studentList.appendChild(studentRow);
            });

            studentList.classList.add('show');
        } else {
            console.log('No students found for the selected criteria'); // Log if no students are found
            alert('No students found for the selected criteria');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while fetching student data.');
    });
}

function toggleAttendance(selectedBtn, otherBtn, studentID, studentName, year, department, division, isPresent) {
    otherBtn.classList.remove('selected');
    selectedBtn.classList.add('selected');
    updateAttendance(studentID, studentName, year, department, division, isPresent);
}

function updateAttendance(studentID, studentName, year, department, division, isPresent) {
    console.log('Updating Attendance:', { studentID, studentName, year, department, division, isPresent }); // Log attendance update

    fetch('php/update_attendance.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ studentID, studentName, year, department, division, isPresent })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log('Attendance updated successfully');
        } else {
            console.log('Failed to update attendance');
            alert('Failed to update attendance');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('An error occurred while updating attendance.');
    });
}
