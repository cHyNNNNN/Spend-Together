//
//  MainView.swift
//  Spend Together
//
//  Created by Jose Manuel Roldan Gomez on 7/3/23.
//

struct MainView: View {
    @State private var expenses: [Expense] = [
        Expense(amount: 50, category: .groceries, currency: .euros),
        Expense(amount: 100, category: .restaurants, currency: .euros),
        Expense(amount: 30, category: .cats, currency: .euros),
        Expense(amount: 200, category: .presents, currency: .euros),
        Expense(amount: 75, category: .trips, currency: .euros),
        Expense(amount: 120, category: .house, currency: .euros),
    ]
    
    @State private var selectedCategory: ExpenseCategory = .groceries
    @State private var selectedCurrency: Currency = .euros
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 233/255, green: 53/255, blue: 110/255), Color(red: 245/255, green: 184/255, blue: 49/255)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .blur(radius: 50)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TitleView(title: "Main Screen")
                
                HStack {
                    TextField("Enter expense amount", text: .constant(""))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                    
                    Button(action: {
                        // Add expense to list
                        let newExpense = Expense(amount: Double("100") ?? 0, category: selectedCategory, currency: selectedCurrency)
                        expenses.append(newExpense)
                        
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                    }
                }
                
                HStack {
                    Text("Category:")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .padding()
                    
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(ExpenseCategory.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Currency:")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white)
                        .padding()
                    
                    Picker("Currency", selection: $selectedCurrency) {
                        ForEach(Currency.allCases, id: \.self) { currency in
                            Text(currency.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding(.horizontal)
                
                List {
                    ForEach(expenses) { expense in
                        ExpenseRowView(expense: expense)
                            .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: deleteExpense)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
                BalanceView(expenses: expenses)
            }
            .padding()
        }
    }
    
    func deleteExpense(at offsets: IndexSet) {
        expenses.remove(atOffsets: offsets)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
