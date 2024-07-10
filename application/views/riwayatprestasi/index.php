<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>
    <?= $this->session->flashdata('message'); ?>

    <div class="row">
        <div class="col-lg">
            <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#newPrestasiModal">Add Prestasi</button>
            <table class="table table-hover" id="dataTable">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Atlet</th>
                        <th>Tahun</th>
                        <th>Kejuaraan</th>
                        <th>Prestasi</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $i = 1; ?>
                    <?php foreach ($riwayat_prestasi as $rp) : ?>
                    <tr>
                        <td><?= $i++; ?></td>
                        <td><?= $rp['atlet_name']; ?></td>
                        <td><?= $rp['tahun']; ?></td>
                        <td><?= $rp['kejuaraan']; ?></td>
                        <td><?= $rp['prestasi']; ?></td>
                        <td>
                            <a href="<?= base_url('riwayatprestasi/edit/' . $rp['id']); ?>" class="badge badge-success">edit</a>
                            <a href="<?= base_url('riwayatprestasi/delete/' . $rp['id']); ?>" class="badge badge-danger" onclick="return confirm('Yakin?');">delete</a>
                        </td>
                    </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="newPrestasiModal" tabindex="-1" role="dialog" aria-labelledby="newPrestasiModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="newPrestasiModalLabel">Add Prestasi</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="addPrestasiForm" action="<?= base_url('riwayatprestasi/add'); ?>" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="atlet_id">Pilih Atlet</label>
                        <select class="form-control" id="atlet_id" name="atlet_id">
                            <?php foreach ($atlet as $a) : ?>
                                <option value="<?= $a['id']; ?>"><?= $a['name']; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="tahun" name="tahun" placeholder="Tahun">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="kejuaraan" name="kejuaraan" placeholder="Kejuaraan">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="prestasi" name="prestasi" placeholder="Prestasi">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script>
$(document).ready(function() {
    $('#addPrestasiForm').on('submit', function(event) {
        event.preventDefault();
        $.ajax({
            url: $(this).attr('action'),
            method: 'POST',
            data: $(this).serialize(),
            success: function(data) {
                $('#newPrestasiModal').modal('hide');
                location.reload();
            }
        });
    });

    $('.badge-danger').on('click', function(event) {
        event.preventDefault();
        if (confirm('Yakin ingin menghapus?')) {
            $.ajax({
                url: $(this).attr('href'),
                success: function(data) {
                    location.reload();
                }
            });
        }
    });
});
</script>
