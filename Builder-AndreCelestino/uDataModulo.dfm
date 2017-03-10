object DataModuleProdutos: TDataModuleProdutos
  OldCreateOrder = False
  Height = 150
  Width = 215
  object ClientDataSetProdutos: TClientDataSet
    PersistDataPacket.Data = {
      550000009619E0BD010000001800000003000000000003000000550006436F64
      69676F04000100000000000944657363726963616F0100490000000100055749
      4454480200020032000556616C6F7208000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 16
    object ClientDataSetProdutosCodigo: TIntegerField
      FieldName = 'Codigo'
      DisplayFormat = '000'
      EditFormat = '000'
    end
    object ClientDataSetProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object ClientDataSetProdutosValor: TFloatField
      FieldName = 'Valor'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
end
