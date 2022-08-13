class xo_item:
    def __init__(self, local_name, name):
        self.local_name = local_name
        self.name = name
        self.category = ""
        self.type = ""
        self.crossoutdb_item = 0
        self.image = ""
        self.image_location = ""

    def add_crossoutdb_data (self, category, type, crossoutdb_item, image, image_location):
        self.category = category
        self.type = type
        self.crossoutdb_item = crossoutdb_item
        self.image = image
        self.image_location = image_location