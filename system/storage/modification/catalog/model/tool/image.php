<?php
class ModelToolImage extends Model {

                public function cdn_rewrite($host_url, $new_image) {
                    require_once(DIR_SYSTEM . 'nitro/core/core.php');
                    require_once(DIR_SYSTEM . 'nitro/core/cdn.php');
                    
                    $nitro_result = nitroCDNResolve($new_image, $host_url);

                    return $nitro_result;
                }
            
	public function resize($filename, $width, $height) {
              if (function_exists("getMobilePrefix") && function_exists("getCurrentRoute") && isNitroEnabled() && !isset($this->request->get["save_image_dimensions"])) {
                $route = getCurrentRoute();

                switch ($route) {
                case "common/home":
                    $page_type = "home";
                    break;
                case "product/category":
                    $page_type = "category";
                    break;
                case "product/product":
                    $page_type = "product";
                    break;
                default:
                    $page_type = "";
                    break;
                }

                if ($page_type) {
                    $device_type = ucfirst(trim(getMobilePrefix(true), "-"));
                    if (!$device_type) {
                        $device_type = "Desktop";
                    }

                    $overrides = getNitroPersistence('DimensionOverride.' . $page_type . '.' . $device_type);
                    if ($overrides) {
                        foreach ($overrides as $override) {
                            if ((int)$override["old"]["width"] == (int)$width && (int)$override["old"]["height"] == (int)$height) {
                                $width = (int)$override["new"]["width"];
                                $height = (int)$override["new"]["height"];
                            }
                        }
                    }
                }
              }
		if (!is_file(DIR_IMAGE . $filename)) {
			return;
		}

		$extension = pathinfo($filename, PATHINFO_EXTENSION);

		$old_image = $filename;
		$new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . '.' . $extension;

		if (!is_file(DIR_IMAGE . $new_image) || (filectime(DIR_IMAGE . $old_image) > filectime(DIR_IMAGE . $new_image))) {
			$path = '';

			$directories = explode('/', dirname(str_replace('../', '', $new_image)));

			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;

				if (!is_dir(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}

			list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);


                $isNitroImageOverrideEnabled = getNitroPersistence('Enabled') && getNitroPersistence('ImageCache.OverrideCompression');
            
			
                if ($width_orig != $width || $height_orig != $height || $isNitroImageOverrideEnabled) {
            
				$image = new Image(DIR_IMAGE . $old_image);
				$image->resize($width, $height);
				$image->save(DIR_IMAGE . $new_image);
			} else {
				copy(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image);
			}
		}

		if ($this->request->server['HTTPS']) {

                $default_link = $this->config->get('config_ssl').'image/'.$new_image;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_ssl'), 'image/'.$new_image);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_ssl') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $new_image);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		} else {

                $default_link = $this->config->get('config_url').'image/'.$new_image;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_url'), 'image/'.$new_image);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_url') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $new_image);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_url') . 'image/' . $new_image;
		}
	}
	
	
// Function to crop an image with given dimensions. What doesn/t fit will be cut off.
	function cropsize($filename, $width, $height) {
	
		if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
			return;
		} 
		
		$info = pathinfo($filename);
		$extension = $info['extension'];
		
		$old_image = $filename;
		$new_image = 'cache/' . substr($filename, 0, strrpos($filename, '.')) . '-cr-' . $width . 'x' . $height . '.' . $extension;
		
		if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
			$path = '';
			
			$directories = explode('/', dirname(str_replace('../', '', $new_image)));
			
			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;
				
				if (!file_exists(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}		
			}
			
			$image = new Image(DIR_IMAGE . $old_image);
			$image->cropsize($width, $height);
			$image->save(DIR_IMAGE . $new_image);
		}
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {

                $default_link = $this->config->get('config_ssl').'image/'.$new_image;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_ssl'), 'image/'.$new_image);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_ssl') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $new_image);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		} else {

                $default_link = $this->config->get('config_url').'image/'.$new_image;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_url'), 'image/'.$new_image);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_url') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $new_image);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_url') . 'image/' . $new_image;
		}	
			
	}
	
	// Function to resize image with one given max size.
	function onesize($filename, $maxsize) {
	
		if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
			return;
		} 
		
		$info = pathinfo($filename);
		$extension = $info['extension'];
		
		$old_image = $filename;
		$new_image = 'cache/' . substr($filename, 0, strrpos($filename, '.')) . '-max-' . $maxsize . '.' . $extension;
		
		if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
			$path = '';
			
			$directories = explode('/', dirname(str_replace('../', '', $new_image)));
			
			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;
				
				if (!file_exists(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}		
			}
			
			$image = new Image(DIR_IMAGE . $old_image);
			$image->onesize($maxsize);
			$image->save(DIR_IMAGE . $new_image);
		}
		
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {

                $default_link = $this->config->get('config_ssl').'image/'.$new_image;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_ssl'), 'image/'.$new_image);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_ssl') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $new_image);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		} else {

                $default_link = $this->config->get('config_url').'image/'.$new_image;
                $cdn_link = $this->cdn_rewrite($this->config->get('config_url'), 'image/'.$new_image);
                if ($default_link == $cdn_link) {
                    return $this->config->get('config_url') . (isset($seoUrlImage) ? $seoUrlImage : 'image/' . $new_image);
                } else {
                    return $cdn_link;
                }
            
			return $this->config->get('config_url') . 'image/' . $new_image;
		}	
			
	}
}