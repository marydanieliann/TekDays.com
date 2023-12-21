function confirmDelete(id) {
    var confirmation = confirm("Are you sure you want to delete this TekEvent?");
    if (confirmation) {
        $.ajax({
            type: "POST",
            url: "/TekDays.com/tekEvent/deleted",
            data: {
                id: id
            },
            success: function(result) {
                if (result.message) {
                    DataTable.reload();
                  //  location.reload();
                } else {
                    alert(result.message);
                }
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    } else {
        // User clicked "Cancel", do nothing
    }
}
