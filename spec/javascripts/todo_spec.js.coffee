describe "Anode.Models.Todo", ->
  
  beforeEach ->
    @todo = new Anode.Models.Todo()

  it "works", ->
    expect(true).toEqual(true)
  it "should be defined", ->
    expect(Anode.Models.Todo).toBeDefined()

  describe "new instance default values", ->
    it "has default value for the .content attribute", ->
      expect(@todo.get('content')).toEqual('')
    it "has default value for the .done attribute", ->
      expect(@todo.get('done')).toBeFalsy()
