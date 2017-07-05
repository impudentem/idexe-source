<table class="table table-hover">
      <thead>
        <tr>
          <th>#</th>
          <th>File name</th>
          <th>Date</th>
        </tr>
      </thead>
      <tbody>
        <?php $i = 1;
        foreach ($files as $file) {
        	echo '<tr>
                      <td>'.$i.'</td>
                      <td>'.str_replace(dirname(DIR_APPLICATION), '', $file).'</td>
                      <td>'.date('[Y-m-d H:i:s]', filemtime($file)).'</td>
				  </tr>';
			$i++;
        }
        ?>
      </tbody>
    </table>
