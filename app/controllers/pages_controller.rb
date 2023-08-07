class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:result_tireoide]
  
  def home
  end

  def tireoide
  end

  def result_tireoide
    @nome = params[:nome]
    @data_nascimento = params[:data_nascimento]
    @data_exame = params[:data_exame]

    @eco_gl = Tireoide.ecotextura_gland(params[:eco_gl])
    @cont_gl = Tireoide.contorno_gland(params[:cont_gl])

    @ltd_l = params[:ltd_l]
    @ltd_ap = params[:ltd_ap]
    @ltd_t = params[:ltd_t]
    @ltd_vol = Tireoide.ltd_volume(params[:ltd_l], params[:ltd_ap], params[:ltd_t])
    @lte_l = params[:lte_l]
    @lte_ap = params[:lte_ap]
    @lte_t = params[:lte_t]
    @lte_vol = Tireoide.lte_volume(params[:lte_l], params[:lte_ap], params[:lte_t])
    
    if params[:istmo_filiforme].present?
      @istmo_med = 'filiforme'
    else
      @istmo_l = params[:istmo_l]
      @istmo_ap = params[:istmo_ap]
      @istmo_t = params[:istmo_t]
      @istmo_vol = Tireoide.istmo_volume(params[:istmo_l], params[:istmo_ap], params[:istmo_t])
      @istmo_med = "#{@istmo_l} x #{@istmo_ap} x #{@istmo_t} cm, com volume de #{@istmo_vol} ml"
    end
    
    @vol_total = Tireoide.volume_total(@ltd_vol, @lte_vol, @istmo_vol)

    @dim_gl = Tireoide.medida_volume(@vol_total)

    @pres_nod = Tireoide.pres_nodular(params[:pres_nod])
    
  end
  
end