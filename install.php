<?php

// NitroPack OCMOD installer. Created by iSenseLabs - http://isenselabs.com

$this->load->model('extension/modification');

if (VERSION === '2.0.0.0') {
    $nitro_install_dir = DIR_DOWNLOAD . str_replace(array('../', '..\\', '..'), '', $this->request->post['path']);
} else {
    $nitro_install_dir = DIR_UPLOAD . str_replace(array('../', '..\\', '..'), '', $this->request->post['path']);
}

$nitro_ocmod_dir = $nitro_install_dir . '/_ocmod';

$nitro_ocmod_files = scandir($nitro_ocmod_dir);

foreach ($nitro_ocmod_files as $nitro_ocmod_file) {
    if (in_array($nitro_ocmod_file, array('.', '..'))) continue;

    $nitro_xml_file = $nitro_ocmod_dir . DIRECTORY_SEPARATOR . $nitro_ocmod_file;
    $nitro_xml_contents = file_get_contents($nitro_xml_file);

    if (VERSION > '2.0.0.0') {
        $nitro_dom = new DOMDocument('1.0', 'UTF-8');
        $nitro_dom->loadXml($nitro_xml_contents);

        $nitro_code_item = $nitro_dom->getElementsByTagName('code')->item(0);

        if ($nitro_code_item) {
            $nitro_code = $nitro_code_item->nodeValue;

            $nitro_modification = $this->model_extension_modification->getModificationByCode($nitro_code);

            if (!empty($nitro_modification)) {
                $this->model_extension_modification->deleteModification($nitro_modification['modification_id']);
            }
        }
    }

    file_put_contents($nitro_install_dir . '/install.xml', $nitro_xml_contents);

    $this->xml();
}
