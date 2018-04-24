class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  def index
    today = Time.new
    day_of_week = today.wday
    @start_of_week = today - (day_of_week * 60 * 60 * 24)
    @entries = Entry.where("created_at > ?", @start_of_week).all
    name = ['abdulm', 'billj', 'danieleg', 'joellem', 'justinr', 'robb', 'seyio', 'sherwoodl']
    @project = ['2018-001 Improve Order Cancelltion Process in eCom',
                '2018-002 Streamline Order Import',
                '2018-003 Need the ability to add lines to existing customer orders',
                '2018-004 Pallet Traceabiiity',
                '2018-005 Increase Inventory Accuracy',
                '2018-006 Packing Efficiency',
                '2018-007 Pick to Ship',
                '2018-008 Integate Roandet into E21 at the SKU Level',
                '2018-009 Problem Log',
                '2018-010 B2B Website',
                '2018-011 CRM - Food Service and Retail',
                '2018-012 Implement Financial Reporting across the two Companies',
                '2018-013 Customer Portal',
                '2018-014 MRP',
                '2018-015 Demand Purchasing System',
                '2018-016 Dashboard with Purchasing Metrics and Analytics',
                '2018-017 Dashboard with Product Metric and Analytics',
                '2018-018 Dashboard with Sales Metric and Analytics',
                '2018-019 Dashboard with Collection Metric and Analytics',
                '2018-020 Dashboard with Retail Metric and Analytics',
                '2018-021 Upselling Report',
                '2018-022 Mobile Device Management',
                '2018-023 Auto Steal',
                "2018-024 Implement Samples under customer's account",
                '2018-025 Invoice Printing for Fedex',
                '2018-026 Sample Orders'
              ]
    p_length = @project.length
    n_length = name.length
    hours = 0
    total_hours = 0
    i = 0
    j = 0
    @projnum = []
    @projname = []
    @projhour = []
    while i < p_length
      # project
      while j < n_length
        # name
        project_entries = Entry.where("project = ? and name = ?", @project[i], name[j]).all
        project_entries.each do |p|
          # accumulate hours for name in project
          hours += p.hours
        end
        if hours != 0
          # only report names that entered hours
          @projnum.push(i)
          @projname.push(name[j])
          @projhour.push(hours)
          total_hours += hours
        end
        hours = 0
        j += 1
      end #name
      if total_hours != 0
        @projnum.push(i)
        @projname.push("Total")
        @projhour.push(total_hours)
      end
      i += 1
      j = 0
      total_hours = 0
    end # project
  end # index

  # GET /entries/1
  def show
  end

  # GET /entries/new
  def new
    @name = ['abdulm', 'billj', 'danieleg', 'joellem', 'justinr', 'robb', 'seyio', 'sherwoodl']
    @project = ['2018-001 Improve Order Cancelltion Process in eCom',
                '2018-002 Streamline Order Import',
                '2018-003 Need the ability to add lines to existing customer orders',
                '2018-004 Pallet Traceabiiity',
                '2018-005 Increase Inventory Accuracy',
                '2018-006 Packing Efficiency',
                '2018-007 Pick to Ship',
                '2018-008 Integate Roandet into E21 at the SKU Level',
                '2018-009 Problem Log',
                '2018-010 B2B Website',
                '2018-011 CRM - Food Service and Retail',
                '2018-012 Implement Financial Reporting across the two Companies',
                '2018-013 Customer Portal',
                '2018-014 MRP',
                '2018-015 Demand Purchasing System',
                '2018-016 Dashboard with Purchasing Metrics and Analytics',
                '2018-017 Dashboard with Product Metric and Analytics',
                '2018-018 Dashboard with Sales Metric and Analytics',
                '2018-019 Dashboard with Collection Metric and Analytics',
                '2018-020 Dashboard with Retail Metric and Analytics',
                '2018-021 Upselling Report',
                '2018-022 Mobile Device Management',
                '2018-023 Auto Steal',
                "2018-024 Implement Samples under customer's account",
                '2018-025 Invoice Printing for Fedex',
                '2018-026 Sample Orders'
              ]
    @entry = Entry.new
    @entry.work_date = Time.now.strftime('%Y-%m-%d')
    @entry.hours = 0.5
  end

  # GET /entries/1/edit
  def edit
    @name = ['abdulm', 'billj', 'danieleg', 'joellem', 'justinr', 'robb', 'seyio', 'sherwoodl']
    @project = ['2018-001 Improve Order Cancelltion Process in eCom',
                '2018-002 Streamline Order Import',
                '2018-003 Need the ability to add lines to existing customer orders',
                '2018-004 Pallet Traceabiiity',
                '2018-005 Increase Inventory Accuracy',
                '2018-006 Packing Efficiency',
                '2018-007 Pick to Ship',
                '2018-008 Integate Roandet into E21 at the SKU Level',
                '2018-009 Problem Log',
                '2018-010 B2B Website',
                '2018-011 CRM - Food Service and Retail',
                '2018-012 Implement Financial Reporting across the two Companies',
                '2018-013 Customer Portal',
                '2018-014 MRP',
                '2018-015 Demand Purchasing System',
                '2018-016 Dashboard with Purchasing Metrics and Analytics',
                '2018-017 Dashboard with Product Metric and Analytics',
                '2018-018 Dashboard with Sales Metric and Analytics',
                '2018-019 Dashboard with Collection Metric and Analytics',
                '2018-020 Dashboard with Retail Metric and Analytics',
                '2018-021 Upselling Report',
                '2018-022 Mobile Device Management',
                '2018-023 Auto Steal',
                "2018-024 Implement Samples under customer's account",
                '2018-025 Invoice Printing for Fedex',
                '2018-026 Sample Orders'
              ]
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params)
    if @entry.hours.blank?
      @entry.hours = 0
    end
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /entries/1
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
    end
  end

  def transmit
  end

  def export
    start_d = params[:start_date].to_date
    end_d = params[:end_date].to_date
    entries = Entry.where("work_date >= ? AND work_date <= ?", start_d, end_d).all
    csv_entries = entries.to_csv
    send_data csv_entries, :type => 'csv', :filename => "export" + params[:end_date] + ".csv"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:name, :project, :hours, :work_date, :start_date, :end_date)
    end
end
