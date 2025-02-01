document.addEventListener('DOMContentLoaded', function() {
    const menuItems = document.querySelectorAll('.menu-item');
    const dashboardSections = document.querySelectorAll('.dashboard-section');

    menuItems.forEach(item => {
        item.addEventListener('click', function() {
            const sectionId = this.getAttribute('data-section');

            // Remove active class from all menu items and sections
            menuItems.forEach(mi => mi.classList.remove('active'));
            dashboardSections.forEach(ds => ds.classList.remove('active'));

            // Add active class to clicked menu item and corresponding section
            this.classList.add('active');
            document.getElementById(sectionId).classList.add('active');

            // Fetch and display notices if the notice section is clicked
            if (sectionId === 'notice') {
                fetchNotices();
            }
        });
    });

    // Modified event listener for the profile button
    document.querySelector('.profile-button').addEventListener('click', function() {
        window.location.href = 'profile.html'; // Open profile.html in the same page
    });
});

function fetchNotices() {
    fetch('php/get_notices.php')
        .then(response => response.json())
        .then(notices => {
            const noticesContainer = document.getElementById('notices-container');

            if (notices.length === 0) {
                noticesContainer.innerHTML = '<p>No notices available.</p>';
                return;
            }

            noticesContainer.innerHTML = notices.map(notice => `
                <div class="notice">
                    <div class="notice-title">${notice.teacherName}</div>
                    <div class="notice-date">${notice.endDate}</div>
                    <div class="notice-content">${notice.noticeText}</div>
                </div>
            `).join('');
        })
        .catch(error => console.error('Error fetching notices:', error));
}

// Fetch and display notices when the page loads
window.onload = function() {
    fetchNotices();
};
