<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?>

<div class="container-fluid">
    <h1 class="h3 mb-4 text-gray-800"><?= $title; ?></h1>

    <?= $this->session->flashdata('message'); ?>

    <?php if (isset($prestasi) && !empty($prestasi)): ?>
        <form method="post" action="<?= base_url('riwayatprestasi/edit/'.$prestasi['id']); ?>">
            <div class="form-group">
                <label for="atlet_id">Nama Atlet</label>
                <select class="form-control" id="atlet_id" name="atlet_id" required>
                    <?php foreach ($atlet as $a): ?>
                        <option value="<?= $a['id']; ?>" <?= $a['id'] == $prestasi['atlet_id'] ? 'selected' : ''; ?>><?= $a['name']; ?></option>
                    <?php endforeach; ?>
                </select>
            </div>
            <div class="form-group">
                <label for="tahun">Tahun</label>
                <input type="text" class="form-control" id="tahun" name="tahun" value="<?= $prestasi['tahun']; ?>" required>
            </div>
            <div class="form-group">
                <label for="kejuaraan">Kejuaraan</label>
                <input type="text" class="form-control" id="kejuaraan" name="kejuaraan" value="<?= $prestasi['kejuaraan']; ?>" required>
            </div>
            <div class="form-group">
                <label for="prestasi">Prestasi</label>
                <input type="text" class="form-control" id="prestasi" name="prestasi" value="<?= $prestasi['prestasi']; ?>" required>
            </div>
            <button type="submit" class="btn btn-primary">Save</button>
        </form>
    <?php else: ?>
        <p>Data prestasi tidak ditemukan.</p>
    <?php endif; ?>
</div>
