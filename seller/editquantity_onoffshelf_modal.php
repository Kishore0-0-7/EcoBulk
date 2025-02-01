<!-- Edit Product Modal -->
<div class="modal fade" id="edit_<?php echo $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Edit Product</h4>
            </div>
            <div class="modal-body">
                <form method="POST" action="update_product.php" class="edit-form">
                    <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                    <div class="form-group">
                        <label>Title:</label>
                        <input type="text" name="title" class="form-control" value="<?php echo $row['title']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Category:</label>
                        <input type="text" name="category" class="form-control" value="<?php echo $row['category']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Quantity:</label>
                        <input type="number" name="quantity" class="form-control" value="<?php echo $row['quantity']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Price:</label>
                        <input type="number" step="0.01" name="price" class="form-control" value="<?php echo $row['price']; ?>" required>
                    </div>
                    <div class="form-group">
                        <label>Description:</label>
                        <textarea name="description" class="form-control" required><?php echo $row['description']; ?></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="submit" name="edit" class="btn btn-success">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Toggle Shelf Status Modal -->
<div class="modal fade" id="delete_<?php echo $row['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Toggle Shelf Status</h4>
            </div>
            <div class="modal-body">
                <p class="text-center">Are you sure you want to turn <?php echo ($row['shelf'] == 'on') ? 'OFF' : 'ON'; ?> this product?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <a href="toggle_shelf.php?id=<?php echo $row['id']; ?>" class="btn btn-warning">Confirm</a>
            </div>
        </div>
    </div>
</div>