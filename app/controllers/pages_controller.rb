class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def md2(text)
    temp1=text.scan (/\\\\.+?\\\\/)
    temp1.each do |t1|
        t1=t1.gsub(/\A\\\\/, '<i>')
        t1=t1.gsub(/\\\\\z/, '</i>')
        text[/\\\\.+?\\\\/]=t1
    end
  text
  end
  def md3(text)
      temp1=text.scan (/\({2}.+?\){2}/)
        temp1.each do |t1|
        t1=t1.gsub(/\(\(/, '<a href="http://')
            t1[/\<a href\=.+?\s/]=t1[/\<a href\=.+?\s/]+'"> '
            t1=t1.gsub(/\)\)\z/, '</a>')
            puts t1
        text[/\({2}.+?\){2}/]=t1
    end
        text
  end
  def md1(text)
      temp=text.scan /\*{2}.+\*{2}/
    temp.each do |t|
           
          t=t.gsub(/\A\*{2}/, '<b>')
          t=t.gsub(/\*{2}\z/, '</b>')
          text[/\*{2}.+\*{2}/]=t
      end#\\{2}\w+?\\{2}
        text
  end
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find_by_title(params[:id])
    @page.val=md3(md2(md1(@page.val))).html_safe

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    #@post = Post.find_by_title(t)
    @page = Page.find_by_title(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(params[:page])
    @page.page_id=params[:id]

    respond_to do |format|
      if @page.save
        format.html { redirect_to 'pages/'+@page.title, notice: 'Page was successfully created.' }
        format.json { render json: @page, status: :created, location: @page }
      else
        format.html { render action: "new" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end

  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find_by_title(params[:page][:title])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to "/pages" }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :ok }
    end
  end
end
