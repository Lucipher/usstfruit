require 'mini_magick'
class Admin::PicturesController <  Admin::BaseController
  def upload
    
    picture = params[:upload_file]
    module_name = params[:module]
    # 定义原始路径  这个路径是要替换成配置文件里的
    # Rails.root.join('app', 'assets', 'images', 'logo.png')
    directory = Rails.root.join('public',"uploads",module_name)
    # 图片服务器根地址
    img_server_url = request.domain

    # 重写文件名 ,这里需要从配置文件里读取根路径,然后根据日期创建目录(如果已经存在就不创建), 用uuid重命名
    name =  picture.original_filename
    time = Time.now.to_i.to_s
    new_name = time+"-"+name
    # 文件名后缀
    path = File.join(directory,new_name)
    resize_path = File.join(directory,"resize_"+new_name)
    
    
    File.open(path, "wb") { |f| f.write(picture.read) }

    
    img = MiniMagick::Image.from_file path
    img.resize 300
    img.write resize_path
    #logger.info(BASE_URL  + File.join("uploads",module_name,new_name).to_s)
    render :json => {:file_path=>BASE_URL + File.join("uploads",module_name,"resize_"+new_name).to_s}
  end
  
end