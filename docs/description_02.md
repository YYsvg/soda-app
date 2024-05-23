### /app/views/homes/index.html.erb
#### ホーム画面
``````
<div class="container mycard">
  <div class="card-body col-sm-9">
  #タブの名前を表示
    <ul class="tab-list list-unstyled">
      <li class="tab tab-active">
        <%= @outcomename %>
      </li>
      <li class="tab">
        <%= @incomename %>
      </li>
    </ul></br>

    <h4 class="card-title">おこづかいちょう</h4><br>

    #選択されたタブを表示させる
    <h5 class="card-text">
    <div>
      <div class="tabbox box-show ">
        <%= render 'layouts/list' %>
      </div>
      <div class="tabbox">
        <%= render 'layouts/form' %>
      </div>
    </div>
  </div>
</div>
``````

### /app/views/layouts/_list.html.erb
#### 支出の入力画面
``````
#フォームを生成
<%= form_with model: @outcome, local: true do |f| %>
    <div>
      <% @outcome_categories.each do |outcome_category| %>
      <div>
        <%= f.radio_button(:outcome_category_id, "#{outcome_category.id}") %>
        <%= f.label :outcome_category_id, "#{outcome_category.name}", {value: outcome_category.id.to_i, style: "display: inline-block;"} %>
      </div>
      <% end %>
    </div><br>

    <div>
      <%= f.label :price,"金額　" %>
      <%= f.number_field :price %>
    </div><br>
    <div>
      <%= f.label :memo,"メモ　" %>
      <%= f.text_field :memo %>
    </div><br>
    <div>
      <%= f.label :image,"写真もどうぞ　" %>
      <%= f.file_field :image %>
    </div><br>
    <div><%= f.submit "入力", class:"submit-color income"%></div><br>
  <% end %>

  #リンク先を表示
  <div>
    <ul class="link-list">
      <li><%= link_to "マイページへ", mypage_users_path, class:"link-color" %></li>
      <li><%= link_to "支出の一覧へ", :outcomes, class:"link-color" %></li>
      <li><%= link_to "やりたいことリストへ", :wants, class:"link-color" %></li>
      <li><%= link_to "支出カテゴリの追加", :new_outcome_category, class:"link-color" %></li>
    </ul>
  </div>

``````

### /app/views/layouts/_month.html.erb
#### マイページ・月毎の集計レポート画面
``````
<div class="container">
  <div class="mycard mx-auto"  style="width: 1000px;">
    <div class="card-body col-sm-9">
      <ul class="tab-list list-unstyled">
            <li class="mytab mytab-active">
              <%= "支出" %>
            </li>
            <li class="mytab">
              <%= "収入" %>
            </li>
      </ul>
      <h4 class="card-title"></h4><br>
      <h5 class="card-text">
      <div>
        <div class="mytabbox mybox-show ">
          <%= render 'layouts/month_outcome' %>
        </div>
        <div class="mytabbox">
          <%= render 'layouts/month_income' %>
        </div>
      </div>
    </div>
  </div>
<br>
``````


### /app/views/layouts/_month_outcome.html.erb
#### 月ごとの支出画面
``````
<div class="texts-wrapper">
  <div class="contents-title text-center">
    <div class="row">
      <% @monthly_outcomes.each do |monthly_data| %>
        <div class="col-12 col-md-6 col-lg-4">
          <div class="card h-70">
            <div class="card-body align-items-center">
                <br class="card-title">
                  <h2><%= monthly_data[:month] %></h2></br>
                  <h3>合計　　<%= number_to_currency(monthly_data[:total_outcomes], unit: "", separator: ".", delimiter: ",", precision:0) %>円
                </h3>
            <br>
            <ul>
              <% monthly_data[:category_outcomes].each do |category_name, category_total| %>
                <li class="category_list"><%= category_name %>　<%= number_to_currency(category_total, unit: "", separator: ".", delimiter: ",", precision:0) %>円</li>
              <% end %>
            </ul>
            </div>
          </div>
        </div>
      <% end %>
    </div>
  </div>
</div>
``````


### /app/views/layouts/_year.html.erb
#### マイページ・年ごとの集計レポート画面
``````
<div>
  <h2><%= "#{@year}年1月1日〜12月31日" %></h2>

  #支出と収入の合計を表示
  <h3>
    <%= "支出　#{number_to_currency(@yearly_outcomes_total, unit: "",separator: '.', delimiter: ',', precision: 0)} 円　" %> | <%= "　収入　#{number_to_currency(@yearly_incomes_total, unit: "", separator: '.', delimiter: ',', precision: 0)} 円" %>
  </h3>
</div>

<div class="mx-auto">
  <div class="card-deck">
    <div class="card">
      <div class="card-body"><br>
        <h3 class="card-title">年間収入</h3><br>
        <h4 class="card-text">
        <%= @yearly_incomes_total.to_s(:delimited) %>円
        </h4>
      </div>
    </div>
    
    <br>
    #収入、支出、残高を表示
    <div class="card">
      <div class="card-body"><br>
        <h3 class="card-title">年間支出</h3><br>
        <h4 class="card-text">
          <%= @yearly_outcomes_total.to_s(:delimited) %>円
        </h4>
      </div>
    </div>
    <div class="card">
      <div class="card-body"><br>
        <h3 class="card-title">残高</h3><br>
        <h4 class="card-text">
          <%= @yearly_balance.to_s(:delimited) %>円
        </h4>
      </div>
    </div>
  </div>
</div>


``````

#### 以上となります。
#### 最後までご覧いただき、ありがとうございました。